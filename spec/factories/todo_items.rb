FactoryBot.define do
  factory :todo_item do
    id {}
    title { Faker::Name.name }
    read { false }
  end
end
