module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :person, Types::PersonType, null: true do
      argument :name, String
      argument :date_of_birth, String
    end

    def person(name:, date_of_birth:)
      Person.find_by("CONCAT(first_name, ' ', last_name) = ? AND date_of_birth = ?", name, date_of_birth)
    end
  end
end
