module Types
  class PersonType < Types::BaseObject
    description "This shows the persons info"
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :name, String, null: false
    field :date_of_birth, String, null: false
    field :phone_number, String, null: true
  end
end