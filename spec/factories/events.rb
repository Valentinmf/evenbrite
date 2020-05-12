# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    user_id { FactoryBot.create(:user).id }
    start_date { DateTime.new(3001, 2, 3, 4, 5, 6) }
    title { 'Hello_world' }
    description { 'come to my event please !' }
    price { rand(18..42) }
    location { 'Paris' }
    duration { 60 }
  end
end
