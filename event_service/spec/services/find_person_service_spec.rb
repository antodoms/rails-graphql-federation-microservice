require 'spec_helper'

RSpec.describe FindPersonService do
  let(:person) { FactoryBot.create :person }
  let(:name) { "incorrect" }
  let(:date_of_birth) { Time.now.strftime("%d/%m/%Y") }
  
  subject(:service) { described_class.new(name, date_of_birth) }
  before { service.process }

  describe "#process" do
    context "when name is correct and date_of_birth is incorrect" do
      let(:name) { person.name }

      it "returns nil" do
        expect(service.person).to be_nil
      end
    end

    context "when name is incorrect anf date_of_birth is correct" do
      let(:date_of_birth) { person.date_of_birth }

      it "returns nil" do
        expect(service.person).to be_nil
      end
    end

    context "when both name and date_of_birth is correct" do
      let(:name) { person.name }
      let(:date_of_birth) { person.date_of_birth }

      it "returns the person" do
        expect(service.person).to eq(person)
      end
    end
  end
end