class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
      create_table :appointments do |t|
          t.integer :user_id
          t.integer :stylist_id
          t.integer :date
          t.timestamps
   end
  end
end
