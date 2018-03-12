20.times do
  Item.create(
    name: Faker::Food.dish,
  )
end