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
