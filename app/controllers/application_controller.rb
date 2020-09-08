class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordInvalid, with: :handle_unprocessable_entity

  def handle_unprocessable_entity(errors)
    render json: {
      message: errors
    }, status: :unprocessable_entity
  end
end
