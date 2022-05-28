module Types
  class PersonType < Types::BaseObject
    description "This shows the persons info"

    key fields: [:name, :date_of_birth]

    field :first_name, String, null: false
    field :last_name, String, null: false
    field :name, String, null: false
    field :date_of_birth, String, null: false
    field :phone_number, String, null: true

    def self.resolve_reference(reference, context)
      Person.find_by("CONCAT(first_name, ' ', last_name) = ? AND date_of_birth = ?", reference[:name], reference[:date_of_birth])
    end
  end
end