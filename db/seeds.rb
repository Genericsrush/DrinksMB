# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
Province.destroy_all
CountryOfOrigin.destroy_all

country_csv_text = File.read(Rails.root.join('lib', 'seeds', 'Country.csv'))
country_csv = CSV.parse(country_csv_text, headers: true)
country_csv.each do |row|
  o = CountryOfOrigin.new
  o.name = row[0]
  o.abbreviation = row['abbreviation']
  o.save
  puts "#{o.name} saved"
  10.times do

  end
end
province_text = File.read(Rails.root.join('lib', 'seeds', 'Canada Provinces.csv'))
province_csv = CSV.parse(province_text, headers: true, encoding: "UTF-8")
cities_csv_text = File.read(Rails.root.join('lib', 'seeds', 'Canada Cities.csv'))
cities_csv = CSV.parse(cities_csv_text, headers: true, encoding: "UTF-8")
province_csv.each do |row|
  o = Province.new
  o.name = row[0]
  o.save
  puts "#{o.name} saved"
  cities_csv.each do |row|
    if o.name == row['province']
      c = City.new
      c.name = row[0]
      c.province = o.id
      c.save
      puts "  ->#{c.name} saved"
    end
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?