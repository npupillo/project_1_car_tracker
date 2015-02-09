#Clear all data
Event.delete_all
Vehicle.delete_all
Vendor.delete_all
Category.delete_all

#Create vehicles
roxanne = Vehicle.create!(nickname: 'Roxanne', make: 'Dodge', model: 'Ram', year: 1999, mileage: 180000, purchase_date: "1999-11-01")
beigesav = Vehicle.create!(nickname: 'BeigeSavage', make: 'Saab', model: '9000', year: 1997, mileage: 220000, purchase_date: "2010-04-01")

junker1 = Vehicle.create!(nickname: 'Junker 1', make: 'Yugo', model: 'ZZ', year: 1980, mileage: 75000, purchase_date: "1983-05-30")

#Create vendors
vend_bagnell = Vendor.create!(name: 'Bagnell Auto Supply')
vend_squantum = Vendor.create!(name: 'Squantum Auto')

#Create categories
cat_maint = Category.create!(name: 'maintenance')
cat_repair = Category.create!(name: 'repair')

#Create events for roxanne
roxanne.events.create(name: 'event1 for roxy', category: cat_maint, vendor: vend_squantum)
roxanne.events.create(name: 'event2 for roxy', category: cat_repair, vendor: vend_bagnell)

#Create events for junker1
junker1.events.create(name: 'event1 for junker1', category: cat_maint, vendor: vend_squantum)
