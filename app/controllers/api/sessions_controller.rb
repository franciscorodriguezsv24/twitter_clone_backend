class Api::SessionsController < Api::ApiController
    skip_before_action :authenticate_user!
    def create 
        user = User.find_by(email: params[:email])
        if user.valid_password?(params[:password])
          session[:user_id] = user.id
          token = Api::JsonWebToken.encode(id: user.id)
          render json: {token: Api::JsonWebToken.encode(id: user.id)}
        else
            render json: {errors: ["invalid email or password"]}
        end
    end
    
    def destroy
        # Cierra la sesión del usuario
        session[:user_id] = nil
        redirect_to root_path, notice: 'Cerraste sesión con éxito'
    end

 
      
end 