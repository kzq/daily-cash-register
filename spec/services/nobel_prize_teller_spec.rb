# frozen_string_literal: true

require "rails_helper"

RSpec.describe NobelPrizeTeller do
  subject { described_class.new(nobel_prizes_archive) }

  let(:nobel_prizes_archive) { JSON.parse(file_fixture("nobel_prizes.json").read) }

  it { is_expected.to have_attributes(data: nobel_prizes_archive) }

  describe "#total_prizes_per_subject" do
    let (:total_prizes_per_subject) { subject.total_prizes_per_subject }

    it "returns an array" do
      expect(total_prizes_per_subject).to be_a(Array)
    end

    it "includes value key" do
      expect(total_prizes_per_subject.first).to have_key(:value)
    end

    it "includes label key" do
      expect(total_prizes_per_subject.first).to have_key(:label)
    end
  end
end
