class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :nickname
      t.string :make
      t.string :model
      t.integer :year
      t.integer :mileage
      t.date :purchase_date
    end
  end
end
