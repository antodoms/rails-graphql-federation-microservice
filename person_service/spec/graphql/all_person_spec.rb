require 'rails_helper'

RSpec.describe Types::PersonType, type: :request do
  let!(:person) { nil }
  let(:query) do
    <<~GQL
      { 
        allPersons {
          nodes {
            name
            firstName
            lastName
            dateOfBirth
            phoneNumber
          }
        }
      }
    GQL
  end

  before do 
    post '/graphql', params: { query: query }
    @result = JSON.parse(response.body).dig("data", "allPersons", "nodes")
  end

  context "when no person is in database" do
    it "will return empty result" do
      expect(@result).to be_empty
    end
  end

  context "when there is a person in database" do
    let!(:person) { FactoryBot.create :person }

    it "returns the person in a list" do
      expect(@result.first["name"]).to eq(person.name)
      expect(@result.first["dateOfBirth"]).to eq(person.date_of_birth)
      expect(@result.first["firstName"]).to eq(person.first_name)
      expect(@result.first["lastName"]).to eq(person.last_name)
      expect(@result.first["phoneNumber"]).to eq(person.phone_number)
    end
  end
end
