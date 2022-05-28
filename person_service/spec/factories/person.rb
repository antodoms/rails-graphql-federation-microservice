FactoryBot.define do
  factory :person do
    first_name { "John" }
    sequence(:last_name) { |n| "Doe#{n}" }
    date_of_birth { 40.years.ago }
    phone_number { "0334946575767" }
  end
end