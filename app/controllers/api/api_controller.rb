class Api::ApiController < ApplicationController
  before_action :set_default_format
    skip_before_action :verify_authenticity_token
    # before_action :authenticate_with_http_token

    before_action :authenticate_user! 


    private 

  # def authenticate_api_user!
  #   # Implementa tu lógica de autenticación aquí
  #   # Si el usuario no está autenticado, puedes responder con un error, por ejemplo:
  #   # render json: { error: "Not authorized" }, status: :unauthorized unless <tu_condicion_de_autenticación>
  # end

  # def render_errors(instance)
  #   @errors = instance.errors
  #   @klass = instance.class
  #   render 'shared/errors', status: :unprocessable_entity
  # end

  def set_default_format
    request.format = :json 
  end

  # def authenticate_token!
  #   payload = JsonWebToken.decode(auth_token)
  #     @current_user = User.find(payload["sub"])
  # rescue JWT::ExpiredSignature
  #   render json: {errors: ["Auth token has expired"]}, status: :unauthorized
  # rescue JWT::DecodeError
  #     render json: {erros: ["invalid auth token"]}, status: :unauthorized
  #   end 

  # def auth_token
  #   @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
  # end
end  