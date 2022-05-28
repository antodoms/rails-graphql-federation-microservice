module Types
  class PersonType < Types::BaseObject
    key fields: [:name, :date_of_birth]
    extend_type

    field :name, String, null: false, external: true
    field :date_of_birth, String, null: false, external: true

    field :events, [Types::EventType], description: "This shows the list of Events for this Person"

    def events
      Person.where(name: object[:name], date_of_birth: { :$gte => object[:dateOfBirth] }).first&.events
    end

    def date_of_birth
      object.date_of_birth.strftime("%d/%m/%Y")
    end
  end
end