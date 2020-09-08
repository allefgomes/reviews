class OpnionsController < ApplicationController
  def create
    product = Product.friendly.find_or_create_by(name: opnion_params['product'])

    render json: Opnion.create!(opnion_params.merge(product: product)), status: :ok
  end

  private

  def opnion_params
    params.permit(:product, :timestamp, :rating, :review_text)
  end
end
