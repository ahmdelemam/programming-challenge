# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from Exception, :with => :rescue_global_exceptions

  def rescue_global_exceptions(exception)
    render_exception_response(exception)
  end

  def render_exception_response(exception)
    if [ActionController::RoutingError, ActiveRecord::RecordNotFound].include?(exception.class)
      render_404_response
    elsif exception.class == ActiveRecord::RecordInvalid
      render_422_response
    else
      render json: { error_code: 'Fidor001', error_message: "Something went Wrong" }, status: :internal_server_error
    end
  end

  def render_404_response
    render json: { error_code: 'Fidor002', error_message: "Not Found!" }, status: :not_found
  end

  def render_422_response
    render json: { error_code: 'Fidor003', error_message: "Unprocessable entity"}, status: :unprocessable_entity
  end

  def pagination_params
    {page: params[:page], per_page: 10}
  end

end
