# frozen_string_literal: true

FactoryBot.define do
  factory :weekly_sale do
    sale  30000
    rent  9730
    cost  14890
    gross_profit 6000
    net_profit 5500

    factory :invalid_weekly_sale do
      sale nil
      rent ""
      cost "abc"
      gross_profit 6000
      net_profit 5500
    end
  end
end
