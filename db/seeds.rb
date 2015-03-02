# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Todo.create(text: "Water plants", complete: "no", row_order: 1, due_on: "2015-03-01", user_id: 2)
Todo.create(text: "Complete homework", complete: "no", row_order: 2, due_on: "2015-03-02", user_id: 2)
Todo.create(text: "Bake brownies", complete: "yes", row_order: 1, due_on: "2015-02-28", user_id: 1)


User.create(name: "Susan", email: "Susan@susan.com", password_digest: "password")
