FactoryBot.define do
  factory :event, class: Incident do
    message { "some message" }
    created_at { Time.now }

    association :person
  end
end