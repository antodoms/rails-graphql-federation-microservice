module Person
  class Event
    include Mongoid::Document
    field :id, type: String
    field :created_at, type: DateTime
    field :message, type: String

    belongs_to :person
  end
end