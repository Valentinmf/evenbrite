# frozen_string_literal: true

require 'time'
class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances

  # Validations

  validates :start_date, presence: true, if: :not_in_past?
  validates :duration, numericality: { greater_than: 0, only_integer: true }, if: :multipe_of_5?
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :title, presence: true, length: { minimum: 5, maximum: 140 }
  validates :price, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1000, only_integer: true }
  validates :location, presence: true

  def not_in_past?
    start_date > Time.now
  end

  def multipe_of_5?
    duration % 5 == 0
  end
end
