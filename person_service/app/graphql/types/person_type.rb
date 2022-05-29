module Types
  class PersonType < Types::BaseObject
    description "This shows the persons info"

    key fields: [:name, :date_of_birth]

    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :name, String, null: false
    field :date_of_birth, String, null: false
    field :phone_number, String, null: true

    def self.resolve_reference(reference, context)
      search_service = FindPersonService.new(reference[:name], reference[:date_of_birth])
      search_service.process
      search_service.person
    end
  end
end