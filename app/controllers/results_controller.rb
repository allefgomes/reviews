class ResultsController < ApplicationController
  before_action :set_product

  def show
    @data_to_dashboard = @product.data_to_dashboard
  end

  private

  def set_product
    @product = Product.find_by_name!(params[:id])
  end
end
