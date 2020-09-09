class ResultsController < ApplicationController
  before_action :set_product

  def show
    @data_to_dashboard = @product.data_to_dashboard
  end

  private

  def set_product
    slug_pagam = params[:id]

    @product = Product.find_by_slug!(slug_pagam.downcase)
  end
end
