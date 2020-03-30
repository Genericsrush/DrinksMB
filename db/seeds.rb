# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
City.destroy_all
Province.destroy_all
CountryOfOrigin.destroy_all
Drink.destroy_all

endnames = ["Ale","Brandy","Tea","Tea","Sherry","Brew",
            "Cappuchino","Cider","Coffee","Cognac","Dark Ale","Dark Beer",
            "Drink","Espresso","Gin","Java","Lager","Light Ale","Light Beer","Mead",
            "Mocha","Red Wine","Rum","Sake","Tea","Tonic","Vodka","Whiskey","White Wine","Wine",
            "Almond","Amazing","Ancient","Angel","Angelic","Apple","Apricot","Arctic","Aromatic",
            "Autumn","Avocado","Balanced","Banana","Basil","Bay Leaf","Beautiful","Beetroot","Black",
            "Blue","Blueberry","Boiled","Brilliant","Brown","Brutal","Burning","Calm","Capital","Caramel",
            "Catnip","Cherry","Cherry Blossom","Chestnut","Chilled","Chilli","Cinnamon","Clouded","Cloudy",
            "Coconut","Cool","Coriander","Cosmic","Cranberry","Crazy","Crimson","Cucumber","Demon","Demonic",
            "Dire","Eastern","Easy","Electric","Elemental","Evil","Extreme","Fainting","Fallen","Fancy",
            "Fantasy","Fast","Final","First","Flaming","Flower","Flying","Forest","Fresh","Frosted","Frozen",
            "Fruity","Garlic","Gentle","Ginger","Gingerroot","Gleaming","Glowing","Grape","Grapefruit","Green",
            "Hazelnut","High","Holy","Honest","Honey","Hot","Hushed","Icy","Imaginary","Incredible","Infinite",
            "Innocent","Insane","Insanity","Jasmine","Kiwi","Lavender","Lavish","Lemon","Lemonade","Lemongrass",
            "Lemony","Lime","Low","Lucky","Mad","Mango","Melon","Mild","Milk","Milky","Mint","Minty","Molten",
            "Mountain","Mystic","Nasty","Nimble","Noble","Northern","Noxious","Numb","Nutmeg","Nutty","Oak",
            "Oaken","Oblivious","Obvious","Orange","Oregano","Palm","Paranoid","Passion Fruit","Peacan","Peanut",
            "Pear","Peppermint","Perfect","Pineapple","Pink","Potato","Precious","Pure","Rainbow","Red","River",
            "Rose","Rose Petal","Rosemary","Rotten","Rough","Rude","Rushed","Saffron","Salt 'n Pepper","Salty","Sanguine",
            "Savage","Scented","Secret","Silent","Smooth","Southern","Spearmint","Spiced","Spicy","Spirit","Spring",
            "Stale","Steamy","Sticky","Strawberry","Sugar","Sugary","Summer","Surprised","Sweet","Tarragon","Thyme",
            "Tiny","Tomato","Tropic","Tropical","Twisting","Ultimate","Unholy","Universal","Unlucky","Vanilla",
            "Vanillabean","Vibrant","Warm","Wasabi","Watermelon","Western","Wet","Whimsical","Whipped","White",
            "Wicked","Wild","Willow","Winged","Winter","Wonderful","Wonderous","Yellow"]


country_csv_text = File.read(Rails.root.join('lib', 'seeds', 'Country.csv'))
country_csv = CSV.parse(country_csv_text, headers: true)
country_csv.each do |row|
  o = CountryOfOrigin.new
  o.name = row[0]
  o.abbreviation = row['abbreviation']
  o.save
  puts "#{o.name} saved"
  2.times do
    d = Drink.create(
      name: Faker::Food.ingredients+" " + endnames.sample,
      description: Faker::Food.description,
      price: Faker::Number.decimal(l_digits:1,r_digits:2),
      new: [true,false].sample,
      discount: [0.0,0.0,0.0,0.0,0.0,0.0,Faker::Number.decimal(l_digits:0,r_digits:2)].sample,
      country_of_origin: o
    )
    d.save
    puts "--> #{d.name} saved"
  end
end
province_text = File.read(Rails.root.join('lib', 'seeds', 'Canada Provinces.csv'))
province_csv = CSV.parse(province_text, headers: true, encoding: "UTF-8")
cities_csv_text = File.read(Rails.root.join('lib', 'seeds', 'Canada Cities.csv'))
cities_csv = CSV.parse(cities_csv_text, headers: true, encoding: "UTF-8")
province_csv.each do |row|
  o = Province.new
  o.name = row[0]
  o.gst = row['gst']
  o.pst = row['pst']
  o.hst = row['hst']
  o.save
  puts "#{o.name} saved"
  cities_csv.each do |row|
    if o.name == row['province']
      c = City.new
      c.name = row[0]
      c.province = o
      c.save
      puts "  ->#{c.name} saved"
    end
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?