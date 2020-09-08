# frozen_string_literal: true

# Opnion model
class Opnion < ApplicationRecord
  belongs_to :product

  validates :timestamp, :rating, :review_text, :product, presence: true
end
