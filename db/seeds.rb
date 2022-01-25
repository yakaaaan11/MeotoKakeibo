# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

CSV.foreach("db/category.csv") do |row|
  Category.create(:id => row[0], :name => row[1], :ancestry => row[2])
end

Family.create!(:name =>"共通財布", :image => File.open('./app/assets/images/財布.png'))
Family.create!(:name =>"夫", :image => File.open('./app/assets/images/夫.png'))
Family.create!(:name =>"妻", :image => File.open('./app/assets/images/妻.png'))

User.create!(:email =>"0@aaa", :password =>"000000")

Budget.create!(:user_id =>1, :category_id => 1, :price =>35000)
Budget.create!(:user_id =>1, :category_id => 2, :price =>10000)
Budget.create!(:user_id =>1, :category_id => 3, :price =>5000)
Budget.create!(:user_id =>1, :category_id => 4, :price =>10000)
Budget.create!(:user_id =>1, :category_id => 5, :price =>7000)
Budget.create!(:user_id =>1, :category_id => 9, :price =>10000)
Budget.create!(:user_id =>1, :category_id => 10, :price =>10000)
Budget.create!(:user_id =>1, :category_id => 11, :price =>90000)

Deposit.create!(:user_id =>1, :price =>1500000)

Income.create!(:user_id =>1, :family_id => 2, :price =>150000, :date =>"2022-01-04", :memo =>"給料")
Income.create!(:user_id =>1, :family_id => 3, :price =>100000, :date =>"2022-01-20", :memo =>"給料")

require "csv"

CSV.foreach("db/pay.csv") do |row|
  Pay.create(:id => row[0], :user_id => row[1], :category_id => row[2], :family_id => row[3], :price => row[4], :date => row[5], :memo => row[6], :is_active => row[7])
end