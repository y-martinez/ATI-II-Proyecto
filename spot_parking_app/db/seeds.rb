# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new(name: 'admin', password: 'admin', type_of_user:'Administrator')
admin.email = 'admin@admin.com'
admin.date_creation = nil
admin.time_of_reservation = nil
admin.save

operator = User.new(name: 'operator1', password:'123', type_of_user:'Operator')
operator.email = 'ope1@operator.com'
operator.date_creation = '2015-02-15'
operator.time_of_reservation = nil
operator.save

operator = User.new(name: 'operator2', password:'123', type_of_user:'Operator')
operator.email = 'ope2@operator.com'
operator.date_creation = '2015-02-15'
operator.time_of_reservation = nil
operator.save

user = User.new(name: 'ybrahin', password:'ybrahin', type_of_user:'User')
user.email ='ybrahin@gmail.com'
user.date_creation = '2015-02-18'
user.time_of_reservation = nil
user.save

user = User.new(name: 'krystle', password:'krystle', type_of_user:'User')
user.email = 'krytle@gmail.com'
user.date_creation = '2015-02-18'
user.time_of_reservation = nil
user.save

user = User.new(name: 'carlos', password:'carlos', type_of_user:'User')
user.email = 'carlos@gmail.com'
user.date_creation = '2015-02-18'
user.time_of_reservation = nil
user.save