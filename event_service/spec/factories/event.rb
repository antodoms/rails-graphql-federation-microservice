FactoryBot.define do
  factory :event do
    message { "some message" }
    created_at { Time.now }

    association :person
  end
end