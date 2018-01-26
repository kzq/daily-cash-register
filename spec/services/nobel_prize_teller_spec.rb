# frozen_string_literal: true

require "rails_helper"

RSpec.describe NobelPrizeTeller do
  let(:nobel_prize_teller) { described_class.new }

  before :each do
    nobel_prize_teller.download
  end

  it "retrieves data from external service" do
    expect(nobel_prize_teller.status).to eq("processed")
  end

  it "parses json data into to hash" do
    expect(nobel_prize_teller.data).to be_a(Hash)
  end

  it "provides list of all nobel prizes catgories"

  it "returns total nobel prizes in physics"

  it "returns total nobel prizes in chemistry"
end
