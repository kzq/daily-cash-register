# frozen_string_literal: true

require "rails_helper"

RSpec.describe WeeklySale, type: :model do
  context "with valid parameters" do
    it "is valid with sale, rent, cost, gross_profit, net_profit" do
      weekly_sale = build(:weekly_sale)
      expect(weekly_sale).to be_valid
    end
  end

  context "with invalid parameters" do
  end
end
