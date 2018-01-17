# frozen_string_literal: true

require "rails_helper"

RSpec.describe Notification, type: :model do
  context "with valid parameters" do
    it "is valid with title and body" do
      notification = build(:notification)
      expect(notification).to be_valid
    end
  end

  context "with invalid parameters" do
    it "is invalid without title" do
      notification = build(:notification, title: nil)
      expect(notification).not_to be_valid
    end

    it "is invalid without body" do
      notification = build(:notification, body: nil)
      expect(notification).not_to be_valid
    end

    it "is invalid without title, error check" do
      notification = build(:notification, title: nil)
      notification.valid?
      expect(notification.errors[:title]).to include("can't be blank")
    end
  end
end
