FactoryBot.define do
  factory :post_data do
    login { Faker::Name.first_name }
    title { Faker::Hipster.word }
    content { Faker::Hipster.paragraph }
  end
end