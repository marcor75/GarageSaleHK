# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
bedroom = Category.create(name: 'Bedroom')
kitchen = Category.create(name: 'Kitchen')
livingroom = Category.create(name: 'Living Room')
bathroom = Category.create(name:'Bathroom')
study = Category.create(name:'Study / Office')
outdoor = Category.create(name:'Outdoor/Patio')
storage = Category.create(name: 'Storage')
dining = Category.create(name: 'Dining')
