class Appointment < ActiveRecord::Base

  validates_presence_of :date_of_visit
  validate :valid_date?

  belongs_to :customer, class_name: "User"
  belongs_to :pet
  belongs_to :doctor, class_name: "User"#, -> { where("users.role = ?", :doctor) }

  private
  def valid_date?
    unless self.date_of_visit && (self.date_of_visit.to_date > Date.current)
      errors.add(:date_of_visit, (errors[:date_of_visit] || "Date should be in future"))
    end
  end
end