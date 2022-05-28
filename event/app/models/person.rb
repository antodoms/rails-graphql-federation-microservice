class Person
  include Mongoid::Document
  field :name, type: String
  field :date_of_birth, type: Date

  has_many :events, class_name: 'Person::Event'
end