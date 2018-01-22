# frozen_string_literal: true

require "rails_helper"

RSpec.describe DashboardCard do
  subject(:card) { build(:dashboard_card) }

  describe "#initialize" do
    context "with valid params" do
      specify { should be_valid }
    end

    context "with invalid params" do
      let(:invalid_card) { build(:invalid_dashboard_card) }

      it "is invalid without value and label" do
        expect(invalid_card).not_to be_valid
      end

      it "populates errors for invalid attributes" do
        invalid_card.valid?
        expect(invalid_card.errors[:value]).to include("can't be blank")
        expect(invalid_card.errors[:label]).to include("can't be blank")
      end
    end

    context "default values" do
      describe "when options are not given" do
        specify { should have_attributes(icon: "icon-ios-help-outline", color: "cyan")  }
      end

      describe "when options given" do
        it "assigns default value to icon" do
          card = build(:dashboard_card, icon: "icon-user1", color: "pink")
          expect(card).to have_attributes(icon: "icon-user1", color: "pink")
        end
      end
    end
  end

  describe "#create" do
    let(:math_card_params) { attributes_for(:dashboard_card, value: "3,000", label:"Math") }
    let(:chemistry_card_params) { attributes_for(:dashboard_card, value: "5,000", label:"Chemistry") }
    let(:physics_card_params) { attributes_for(:dashboard_card, value: "4,000", label:"Physics") }

    it "creates a single dashboard card" do
      card = described_class.create(math_card_params)
      expect(card).to an_instance_of(described_class)
      expect(card).to have_attributes(value: "3,000", label: "Math")
    end

    it "creates multiple dashboard cards" do
      math_card = described_class.create(math_card_params)
      chemistry_card = described_class.create(chemistry_card_params)
      physics_card = described_class.create(physics_card_params)
      cards = described_class.create([math_card_params, physics_card_params,chemistry_card_params])
      expect(cards).to match_array([math_card, physics_card, chemistry_card])
    end
  end
end
