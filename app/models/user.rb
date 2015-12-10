class User < ActiveRecord::Base

  validates_presence_of :name
  validates_length_of :name, maximum: 35

  validates_length_of :zip, minimum: 5
  validates_numericality_of :years_in_practice, greater_than_or_equal_to: 1, less_than_or_equal_to: 100, if: Proc.new { |user| user.role == 'doctor' }

  validates_inclusion_of :role, in: %w(doctor receptionist customer)

  has_many :appointments
  has_many :pets_through_appointments, through: :appointments
  has_many :pets

  def self.authenticate_user(params)
    where(email: params[:email], password: params[:password]).last
  end

  def access_for_doctors
    self.owner? ? User.where(role: 'doctor') : []
  end

  def appointments
    if self.role == 'doctor'
      Appointment.where(doctor_id: self.id)
    elsif self.role == 'customer'
      Appointment.where(customer_id: self.id)
    end
  end

  def pets
    Pet.where(customer_id: self.id)
  end

  def pets_through_appointments
    if self.role == 'doctor'
      Pet.joins(:appointments).where(appointments: {doctor_id: self.id})
    elsif self.role == 'customer'
      Pet.joins(:appointments).where(appointments: {customer_id: self.id})
    end
  end

end