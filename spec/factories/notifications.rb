# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    title "You have new job offer"
    body  "Student ambassador at Kingston University. Sat 11:00 - 13:30Student ambassador at Kingston University. Sat 11:00 - 13:30Student ambassador at Kingston University. Sat 11:00 - 13:30"

    factory :invalid_notification do
      body nil
    end
  end


end
