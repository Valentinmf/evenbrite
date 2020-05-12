# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'john' }
    last_name { 'Doe' }
    email { 'johndoe@mail.com' }
    encrypted_password { 'lulu' }
    description { 'Hello World' }
  end
end
