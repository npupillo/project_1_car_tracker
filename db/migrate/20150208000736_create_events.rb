class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.belongs_to :vehicle, index: true
      t.belongs_to :category, index: true
      t.belongs_to :vendor, index: true
      t.decimal :cost
      t.date :event_date
      t.date :due_date
      t.string :notes
    end
    add_foreign_key :events, :vehicles
    add_foreign_key :events, :categories
    add_foreign_key :events, :vendors
  end
end
