FactoryBot.define do
  factory :person, class: Person do
    sequence(:name) { |n| "John Doe #{n}" }
    date_of_birth { 40.years.ago }
  end
end