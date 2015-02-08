#Create vehicles
roxanne = Vehicle.create!(nickname: 'Roxanne', make: 'Dodge', model: 'Ram', year: 1999, mileage: 180000, purchase_date: "1999-11-01")
beigesav = Vehicle.create!(nickname: 'BeigeSavage', make: 'Saab', model: '9000', year: 1997, mileage: 220000, purchase_date: "2010-04-01")

#Create vendors
vend_bagnell = Vendor.create!(name: 'Bagnell Auto Supply')
vend_squantum = Vendor.create!(name: 'Squantum Auto')

#Create categories
cat_maint = Category.create!(name: 'maintenance')
cat_repair = Category.create!(name: 'repair')

