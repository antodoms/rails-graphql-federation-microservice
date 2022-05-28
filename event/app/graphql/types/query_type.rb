module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :person, Types::PersonType, null: true do
      argument :name, String
      argument :date_of_birth, String
    end

    def person(name:, date_of_birth:)
      Person.where(name: name, date_of_birth: date_of_birth).first
    end
  end
end
