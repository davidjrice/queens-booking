# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
devices = Device.create([
  {name: "Device 1"},
  {name: "Device 2"},
  {name: "Device 3"}
 ])

users = User.create([
  {email: "rachel.rice@gmail.com", encrypted_password: "$2a$10$yOpXA7Bk.7.eQ9..bewSE.lSsS3nH3KJtWeGfKRy/wW2lGCWkdOjG", user_type: "student"},
  {email: "rrice03@qub.ac.uk", user_type: "admin"}
  ])

