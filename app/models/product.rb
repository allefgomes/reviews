# frozen_string_literal: true

# Product model
class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 60 }, uniqueness: true

  has_many :opnions

  default_scope { left_outer_joins(:opnions).includes(:opnions) }
  after_validation :set_slug

  def set_slug
    self.slug = name.downcase.split(' ').join('_') unless name.nil?
  end

  def data_to_dashboard
    opnions_last_tree_months = opnions
                               .where('created_at > ? AND created_at < ?',
                                      Time.now.beginning_of_month, Time.now.end_of_month)
    {
      count_opnions: opnions.length,
      average_rating: calculate_average(opnions),
      count_opnions_last_3_months: opnions_last_tree_months.length,
      average_rating_last_3_months: calculate_average(opnions_last_tree_months)
    }
  end

  private

  def calculate_average(opnions)
    result = opnions.sum { |opnion| opnion[:rating] }.to_f / opnions.length

    return 0 if result.nan?

    result
  end
end
