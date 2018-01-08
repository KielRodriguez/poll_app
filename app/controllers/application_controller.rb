class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def authenticate
    token_str = params[:token]
    token = Token.find_by(token: token_str)

    if token.nil? or !token.is_valid?
      render json: { error: "Invalid token", status: :unauthorized }
    else
      @current_user = token.user
    end
  end
end
