# frozen_string_literal: true

require "rails_helper"

RSpec.describe NobelPrizeDataCollector do
  let(:data_collector) { described_class.new }
  let(:response) { { prize: "prize" }.to_json }

  before :each do
    stub_request(:get, "http://api.nobelprize.org/v1/prize.json").to_return(body: response, status: 200)
  end

  describe "#collect" do
    it "fetches data from the external feed" do
      data = data_collector.collect
      expect(data).to be_an_instance_of(Hash)
      expect(data.dig("prize")).to eq("prize")
      expect(data).to eq(JSON.parse(response))
    end
  end
end