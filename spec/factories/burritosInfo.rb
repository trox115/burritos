FactoryBot.define do
  factory :burritos, class: BurritosInfo do
    name { Faker::Company.name }
    address { Faker::Address.street_address }
    address_line_2 { Faker::Address.secondary_address }
    lat { Faker::Address.latitude }
    lng { Faker::Address.latitude }
    category_id { Faker::Number.between(from: 1000, to: 1200) }
    category_id2 { Faker::Number.between(from: 2000, to: 2200) }
    closed { Faker::Boolean.boolean(true_ratio: 0.5) }
    phone_number { Faker::PhoneNumber.phone_number_with_country_code }
    website { 'http://localistico.com' }
  end
end
