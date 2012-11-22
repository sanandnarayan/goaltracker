# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: "anand@devbrother.com", password: "iwillwin")
goal = Goal.create(name: "devbrother", user: user)
goal.tasks.create(name: "sociorent")
goal.tasks.create(name: "zenkars")
goal.tasks.create(name: "embibe")

goal2 = Goal.create(name: "quickburp", user: user)
goal2.tasks.create(name: "seo")
goal2.tasks.create(name: "orders")
