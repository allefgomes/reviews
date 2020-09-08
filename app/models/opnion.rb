# frozen_string_literal: true

# Opnion model
class Opnion < ApplicationRecord
  belongs_to :product

  validates :timestamp, :rating, :review_text, :product, presence: true
  validates :rating, inclusion: { in: 0..10, message: 'Validation failed: Rating need between 1 and 10.' }
end
