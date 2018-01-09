# frozen_string_literal: true

class WeeklySale < ApplicationRecord
  has_many_attached :daily_sale_sheets
  validates :sale, :rent, :cost, :gross_profit, :net_profit, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0, less_than: 1_000_000 }
end
