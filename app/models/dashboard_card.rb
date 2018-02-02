# frozen_string_literal: true

class DashboardCard
  include ActiveModel::Validations

  validates :value, :label, presence: true

  attr_accessor :value, :label, :icon, :color

  def initialize(card = {})
    @value, @label, @icon, @color = card.fetch(:value), card.fetch(:label), card.fetch(:icon, "icon-ios-help-outline"), card.fetch(:color, "cyan")
  end

  # create single or multiple dashboard cards
  def self.create(cards = nil)
    if cards.is_a?(Array)
      cards.collect { |card| new(card) }
    else
      new(cards)
    end
  end

  def ==(other_object)
    self.value == other_object.value && self.label == other_object.label
  end
end
