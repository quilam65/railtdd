FactoryBot.define do
  factory :product do
    title 'Ruby Book'
    description 'This is Ruby Book'
    price 1
    category_id { create(:category).id }
  end
end
