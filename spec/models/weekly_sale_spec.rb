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
    it "is invalid without sale" do
      expect(build(:weekly_sale, sale: nil)).not_to be_valid
    end

    describe "rent validations" do
      it "is invalid without rent" do
        weekly_sale = build(:weekly_sale, rent: nil)
        weekly_sale.valid?
        expect(weekly_sale.errors[:rent]).to include("can't be blank")
      end

      it "is invalid if not a number" do
        weekly_sale = build(:weekly_sale, rent: "abc")
        weekly_sale.valid?
        expect(weekly_sale.errors[:rent]).to include("is not a number")
      end
    end

    it "is invalid without cost" do
      expect(build(:weekly_sale, cost: nil)).not_to be_valid
    end

    it "is invalid without gross_profit" do
      expect(build(:weekly_sale, gross_profit: nil)).not_to be_valid
    end

    it "is invalid without net_profit" do
      expect(build(:weekly_sale, net_profit: nil)).not_to be_valid
    end
  end
end
