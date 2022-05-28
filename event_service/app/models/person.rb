class Person
  include Mongoid::Document
  field :name, type: String
  field :date_of_birth, type: DateTime

  has_many :events
end