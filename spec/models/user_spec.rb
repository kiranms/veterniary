require 'rails_helper'

describe User, type: :model do
  let(:user) { FactoryGirl.create :user }
  let(:doctor) { FactoryGirl.create :doctor, owner: true }

  describe '.authenticate_user' do
    subject { described_class.authenticate_user(user_params) }
    context "when correct params were passed" do
      let(:user_params) { {email: user.email, password: user.password} }
      it 'should return a user' do
        expect(subject).to eq(user)
        expect(subject).to be_kind_of(User)
      end
    end

    context "when bad params were passed" do
      let(:user_params) { {email: user.email, password: user.password+"1"} }
      it 'should return nil' do
        expect(subject).to be_nil
      end
    end
  end

  describe '#access_for_doctors' do
    context "when user is owner" do
      it 'should return all doctors' do
        expect(doctor.access_for_doctors).to include(doctor)
      end
    end

    context "when user is not owner" do
      it 'should return empty' do
        expect(user.access_for_doctors).to be_empty
      end
    end
  end

  describe '#appointments' do
    let(:appointment) { FactoryGirl.create :appointment, doctor: doctor, customer: user }
    context 'when logged in as doctor' do
      it 'should return his appointments' do
        expect(doctor.appointments).to include(appointment)
      end
    end

    context 'when logged in as user' do
      it 'should return his appointments' do
        expect(user.appointments).to include(appointment)
      end
    end
  end

end