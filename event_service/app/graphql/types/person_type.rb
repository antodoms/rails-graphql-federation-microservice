module Types
  class PersonType < Types::BaseObject
    key fields: [:name, :date_of_birth]
    extend_type

    field :name, String, null: false, external: true
    field :date_of_birth, String, null: false, external: true

    field :events, [Types::EventType], description: "This shows the list of Events for this Person"

    def events
      search_service = FindPersonService.new(object[:name], object[:dateOfBirth])
      search_service.process
      search_service.events
    end

    def date_of_birth
      object.date_of_birth.strftime("%d/%m/%Y")
    end
  end
end