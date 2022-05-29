module Types
  class EventType < Types::BaseObject
    description "This shows the persons info"
    field :id, type: ID, null: false
    field :created_at, type: String, null: false
    field :message, type: String, null: false

    # Fields can return lists of other objects:
    field :person, Types::PersonType, description: "This shows the Person for which this event was created"

    def self.resolve_reference(reference, context)
      search_service = FindPersonService.new(reference[:name], reference[:date_of_birth])
      search_service.process
      search_service.events
    end
  end
end