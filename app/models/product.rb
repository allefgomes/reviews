# frozen_string_literal: true

# Product model
class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, length: { maximum: 60 }, uniqueness: true

  has_many :opnions
end
