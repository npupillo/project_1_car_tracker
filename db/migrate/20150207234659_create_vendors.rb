class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :website
      t.string :hours
    end
  end
end
