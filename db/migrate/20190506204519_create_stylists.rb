class CreateStylists < ActiveRecord::Migration[5.2]
  def change
      create_table :stylists do |t|
          t.string :name
          t.integer :rate
          t.timestamps
   end
  end
end
