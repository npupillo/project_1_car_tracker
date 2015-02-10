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

# #Create categories
cat_maint = Category.create!(name: 'maintenance')
cat_repair = Category.create!(name: 'repair')

# #Create events for roxanne
roxanne.events.create!(name: 'oil change', category: cat_maint, vendor: vend_squantum, cost: 65.00, event_date: '2014-11-05', due_date: '2014-11-10', notes: 'paid extra for synthetic oil')
roxanne.events.create!(name: 'flat tire', category: cat_repair, vendor: vend_bagnell, cost: 90.00, event_date: '2015-01-15', due_date: '2015-01-15', notes: 'free tire rotation')

# #Create events for beigesavage
beigesav.events.create!(name: 'fuel pump', category: cat_repair, vendor: vend_squantum, cost: 100.00, event_date: '2014-10-25', due_date: '2014-10-25')
beigesav.events.create!(name: 'air filter', category: cat_repair, vendor: vend_squantum, cost: 20.00, event_date: '2015-02-06', due_date: '2015-02-06')

# #Create events for junker1
junker1.events.create!(name: 'hit a wall', category: cat_repair, vendor: vend_squantum, cost: 300.00, event_date: '2014-09-01', due_date: '2014-09-01')
junker1.events.create!(name: 'new roof', category: cat_repair, vendor: vend_bagnell, cost: 500.00, event_date: '2014-03-20', due_date: '2014-03-20')
junker1.events.create!(name: 'new engine', category: cat_repair, vendor: vend_bagnell, cost: 2000.00, event_date: '2015-02-09', due_date: '2015-02-09')
