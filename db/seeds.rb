# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  Manufacturer.create(name: Faker::Company.name)
end
manufacturer_ids = Manufacturer.all.ids

[
  'Fresh Meat', 'Vegetables', 'Fruit and Nut Gifts', 'Fresh Berries', 'Ocean Foods',
  'Butter and Eggs', 'Fastfood', 'Oatmeal', 'Fresh Bananas'
].each do |type_name|
  product_type = ProductType.create(name: type_name)
  3.times do |n|
    product_name = Faker::Lorem.words(number: 2).join(' ')
    product = Product.create(name: product_name, manufacturer_id: manufacturer_ids[n])
    product.image.attach(io: File.open(Rails.root.join("app/assets/images/seed/#{type_name.underscore.gsub(' ', '_')}_#{n}.png")),
                       filename: "#{product_name.underscore.gsub(' ', '_')}", content_type: 'image/png')
    product.product_types << product_type
  end
end