class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :date_of_visit
      t.integer :customer_id
      t.integer :pet_id
      t.boolean :requires_reminder
      t.text :reason_for_visit

      t.timestamps
    end
  end
end
