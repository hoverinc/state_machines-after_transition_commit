FactoryBot.define do
  factory :cat do
    name { FFaker::Name.name }
    state { :asleep }
  end
end
