require 'pry'
ActiveRecord::Base.logger = Logger.new(STDOUT)

pamyk = User.find_or_create_by(name: "Pamyk", phone_number: "555-555-5555")
pamyk.update(phone_number: '813-843-8189')
josh = User.find_or_create_by(name: "Josh", phone_number: "444-544-5678")
sam = User.find_or_create_by(name: "Sam", phone_number: "334-464-4563")



jessica = Stylist.find_or_create_by(name: "Jessica", rate: 50)
vanessa = Stylist.find_or_create_by(name: "Vanessa", rate: 45)
max = Stylist.find_or_create_by(name: "Max", rate: 47)

pamyk = Appointment.find_or_create_by(user_id: pamyk.id, stylist_id: jessica.id)
sam = Appointment.find_or_create_by(user_id: sam.id, stylist_id: max.id)

binding.pry
