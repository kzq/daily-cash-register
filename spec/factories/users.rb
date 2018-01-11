FactoryBot.define do
  factory :user do
    email 'kami@yahoo.com'
    password '123456'
    confirmed_at Date.today
  end
end