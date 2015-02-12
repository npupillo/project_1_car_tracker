#Clear all data
Event.delete_all
Vehicle.delete_all
Vendor.delete_all
Category.delete_all

#Create vehicles
roxanne = Vehicle.create!(nickname: 'Roxanne', make: 'Dodge', model: 'Ram', year: 1999, mileage: 180000, purchase_date: "1999-11-01")
beigesav = Vehicle.create!(nickname: 'BeigeSavage', make: 'Saab', model: '9000', year: 1997, mileage: 220000, purchase_date: "2010-04-01")
greenmonster = Vehicle.create!(nickname: 'Green Monster', make: 'Yugo', model: 'ZZ', year: 1980, mileage: 75000, purchase_date: "1983-05-30")

#Create vendors
vend_bagnell = Vendor.create!(name: 'Bagnell Auto Supply')
vend_squantum = Vendor.create!(name: 'Squantum Auto')
vend_pep = Vendor.create!(name: 'Pep Boys')

# #Create categories
cat_maint = Category.create!(name: 'maintenance')
cat_repair = Category.create!(name: 'repair')

# #Create events for roxanne
roxanne.events.create!(name: 'tune up', category: cat_maint, vendor: vend_squantum, cost: 90.00, event_date: '2015-11-05', due_date: '2015-11-05', notes: 'get new headlight bulbs' )
roxanne.events.create!(name: 'oil change', category: cat_maint, vendor: vend_squantum, cost: 65.00, event_date: '2015-03-01', due_date: '2014-10-25', notes: "pay extra for synthetic oil, it's worth it" )
roxanne.events.create!(name: 'new steel wheels', category: cat_repair, vendor: vend_bagnell, cost: 90.00, event_date: '2015-04-01', due_date: '2014-11-15', notes: 'free balance')
roxanne.events.create!(name: 'new windshield', category: cat_repair, vendor: vend_pep, cost: 150.00, event_date: '2013-07-15', due_date: '2013-07-15', notes: 'free tire rotation')

# #Create events for beigesavage
beigesav.events.create!(name: 'replace brakes', category: cat_repair, vendor: vend_squantum, cost: 200.00, event_date: '2015-03-15', due_date: '2014-09-02')
beigesav.events.create!(name: 'replace emergency brake', category: cat_repair, vendor: vend_squantum, cost: 75.00, event_date: '2015-04-25', due_date: '2015-01-01')
beigesav.events.create!(name: 'air filter', category: cat_repair, vendor: vend_squantum, cost: 20.00, event_date: '2014-02-06', due_date: '2014-02-06')


# #Create events for greenmonster
greenmonster.events.create!(name: 'plummeted off Winter River Bridge', category: cat_repair, vendor: vend_squantum, cost: 800.00, event_date: '2014-09-01', due_date: '2014-09-01')
greenmonster.events.create!(name: 'new roof', category: cat_repair, vendor: vend_bagnell, cost: 500.00, event_date: '2014-03-20', due_date: '2014-03-20')
greenmonster.events.create!(name: 'replace engine', category: cat_repair, vendor: vend_bagnell, cost: 1500.00, event_date: '2015-05-01', due_date: '2013-02-09')
greenmonster.events.create!(name: 'replace transmission', category: cat_repair, vendor: vend_bagnell, cost: 1000.00, event_date: '2015-05-01', due_date: '2013-02-09')
