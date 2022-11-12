# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first
Product.destroy_all
Category.destroy_all

# Faker seed script
4.times do
  category = Category.new(name:        Faker::Cannabis.category.capitalize,
                          description: Faker::ChuckNorris.fact)
  category.save

  25.times do
    product = Product.new(name:        Faker::Cannabis.strain,
                          description: Faker::ChuckNorris.fact,
                          sku:         Faker::Number.number(digits: 10),
                          price:       Faker::Number.number(digits: 5),
                          stock:       Faker::Number.number(digits: 2),
                          category:    category)
    downloaded_image = URI.open("https://source.unsplash.com/600x600/?cannabis")
    product.image.attach(io: downloaded_image, filename: "m-#{product.name}.jpg")
    product.save
  end
end

# .csv seed script
require "csv"

def load_csv(type)
  csv_file = Rails.root.join("db/#{type}.csv")
  csv_data = File.read(csv_file)
  parsed_csv = CSV.parse(csv_data, headers: true)

  # If CSV was created by Excel in Windows you may also need to set an encoding type:
  # products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')
  if type == "categories"
    parsed_csv.each do |row|
      record = Category.new(name: row["name"], description: row["description"])
      record.save
    end
  end

  if type == "products"
    parsed_csv.each do |row|
      category = Category.find_or_create_by(name: row["category"])
      record = Product.new(name: row["name"], description: row["description"], category: category,
                           sku: row["sku"], price: row["price"], stock: row["stock"])
      record.save
    end
  end
end

load_csv("categories")
load_csv("products")
