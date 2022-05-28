module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :events, [Types::EventType], null: true do
      argument :name, String
      argument :date_of_birth, String
    end

    def events(name:, date_of_birth:)
      Person.where(name: name, date_of_birth: { :$gte => date_of_birth }).first&.events
    end
  end
end
