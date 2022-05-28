module Types
  class PersonType < Types::BaseObject
    description "This shows the persons info"
    field :name, String
    field :date_of_birth, String

    field :events, [Types::EventType], description: "This shows the list of Events for this Person"

    def date_of_birth
      object.date_of_birth.strftime("%d/%m/%Y")
    end
  end
end