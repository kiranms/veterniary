class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :school_name
      t.integer :years_in_practice
      t.string :role
      t.boolean :owner

      t.timestamps
    end
  end
end
