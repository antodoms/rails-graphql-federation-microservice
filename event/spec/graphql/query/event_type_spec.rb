require 'rails_helper'

RSpec.describe Types::EventType, type: :request do
  let(:event) { FactoryBot.create :event }
  let(:person) { event.person }
  let(:name) { person.name }
  let(:date_of_birth) { person.date_of_birth.strftime("%d/%m/%Y") }
  let(:query) do
    <<~GQL
      { 
        person(name: "#{name}", dateOfBirth: "#{date_of_birth}") {
          name
          dateOfBirth
          events {
            message
          }
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
    it "returns the details correctly" do
      expect(@result["name"]).to eq(person.name)
      expect(@result["dateOfBirth"]).to eq(person.date_of_birth.strftime("%d/%m/%Y"))

      expect(@result["events"]).to match([{message: event.message}].as_json)
    end
  end
end
