# frozen_string_literal: true

FactoryBot.define do
  factory :attendance do
    user_id { FactoryBot.create(:user).id }
    event_id { FactoryBot.create(:event).id }
    stripe_customer_id { 'stripe' }
  end
end
