require 'rails_helper'

RSpec.describe Types::PersonType, type: :request do
  let(:person) { FactoryBot.create :person }
  let(:name) { person.name }
  let(:date_of_birth) { person.date_of_birth }
  let(:query) do
    <<~GQL
      { 
        person(name: "#{name}", dateOfBirth: "#{date_of_birth}") {
          name
          firstName
          lastName
          dateOfBirth
          phoneNumber
        }
      }
    GQL
  end

  before do
    post '/graphql', params: { query: query }
    @result = JSON.parse(response.body).dig("data", "person")
  end

  context "when incorrect query" do
    let(:name) { "incorrect name" }
    it "returns a nil person" do
      expect(@result).to be_nil
    end
  end

  context "when correct query" do
    it "returns the name and date of birth correctly" do
      expect(@result["name"]).to eq(person.name)
      expect(@result["dateOfBirth"]).to eq(person.date_of_birth)
      expect(@result["firstName"]).to eq(person.first_name)
      expect(@result["lastName"]).to eq(person.last_name)
      expect(@result["phoneNumber"]).to eq(person.phone_number)
    end
  end
end
