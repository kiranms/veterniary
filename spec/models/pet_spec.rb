require 'rails_helper'

describe Pet, type: :model do
  describe '#next_appointment' do
    let(:user) { FactoryGirl.create :user }
    let(:pet) { FactoryGirl.create :dog, customer: user }
    let!(:appointment) { FactoryGirl.create :appointment, pet: pet, customer: user }

    context 'when pet has next appointment' do
      it 'should return the appointment' do
        expect(pet.next_appointment).to eq(appointment)
      end
    end
  end
end