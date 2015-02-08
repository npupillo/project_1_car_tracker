class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :nickname, null: false
      t.string :make, null: false
      t.string :model, null: false
      t.integer :year, null: false
      t.integer :mileage, null: false
      t.date :purchase_date, null: false
    end
  end
end
