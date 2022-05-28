require 'rails_helper'

RSpec.describe Types::EventType, type: :request do
  let(:event) { FactoryBot.create :event }
  let(:person) { event.person }
  let(:name) { person.name }
  let(:date_of_birth) { person.date_of_birth.strftime("%d/%m/%Y") }
  let(:query) do
    <<~GQL
      { 
        events(name: "#{name}", dateOfBirth: "#{date_of_birth}") {
          message  
          person {
            name
            dateOfBirth
          }
        }
      }
    GQL
  end

  before do
    post '/graphql', params: { query: query }

    @result = JSON.parse(response.body).dig("data", "events")
  end

  context "when incorrect query" do
    let(:name) { "incorrect name" }
    it "returns a nil person" do
      expect(@result).to be_nil
    end
  end

  context "when correct query" do
    it "returns the details correctly" do
      expect(@result.first["message"]).to eq(event.message)

      expect(@result.first["person"]).to match({name: person.name, dateOfBirth: person.date_of_birth.strftime("%d/%m/%Y")}.as_json)
    end
  end
end
