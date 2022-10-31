# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first
Product.destroy_all
Category.destroy_all

4.times do
  category = Category.new(name:        Faker::Cannabis.category,
                          description: Faker::Lorem.sentence(word_count: 15))
  category.save

  25.times do
    product = Product.new(name:        Faker::Cannabis.strain,
                          description: Faker::Lorem.sentence(word_count: 15),
                          sku:         Faker::Number.number(digits: 10),
                          price:       Faker::Number.number(digits: 10),
                          stock:       Faker::Number.number(digits: 2),
                          category:    category)
    product.save
  end
end
