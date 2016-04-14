# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Blog::User.create do |u|
  u.name                  = "Hi"
  u.email                 = "hi@mepop.co"
  u.password              = "123456789"
  u.password_confirmation = "123456789"
end
