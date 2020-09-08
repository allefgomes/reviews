class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  
  rescue_from ActiveRecord::RecordInvalid, with: :handle_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  rescue_from ActiveRecord::NotNullViolation, with: :handle_not_null

  def handle_unprocessable_entity(errors)
    render json: {
      message: errors
    }, status: :unprocessable_entity
  end

  def handle_not_null
    render json: {
      message: 'Product not valid'
    }, status: :unprocessable_entity
  end

  def handle_not_found
    render json: {
      message: 'Record not found'
    }, status: :not_found
  end
end
