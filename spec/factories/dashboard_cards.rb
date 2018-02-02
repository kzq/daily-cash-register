# frozen_string_literal: true

FactoryBot.define do
  factory :dashboard_card do
    value "£2,500"
    label "Physics"

    initialize_with { new(value: value, label: label) }

    factory :dashboard_card_with_defaul do
      value "£2,500"
      label "Physics"
    end

    factory :invalid_dashboard_card do
      value nil
      label nil
    end
  end
end
