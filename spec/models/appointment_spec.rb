require 'rails_helper'

describe Appointment, type: :model do
  describe '#valid_date?' do
    context 'when date of visit is in future' do
      let(:appointment) { FactoryGirl.build :appointment }
      it 'should return true' do
        expect(appointment.valid?).to be_truthy
      end
    end

    context 'when date of visit is in past' do
      let(:appointment) { FactoryGirl.build :appointment, date_of_visit: Time.now - 2.hours }
      it 'should return false' do
        expect(appointment.valid?).to be_falsey
      end
    end
  end
end