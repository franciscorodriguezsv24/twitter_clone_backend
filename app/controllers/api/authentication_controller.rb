# class Api::AuthenticationController <  Api::ApiController
#     skip_before_action :authenticate_token!
#     # before_action :authenticate_with_http_token

#     # def create
#     #     user = User.find_by(email: params[:user][:email])
#     #     if user.valid_password? params[:user][:password]
#     #         render json: {token: JsonWebToken.encode(sub: user.id)}
#     #     else 
#     #         render json: {errors: ["invalid email or password"]}
#     #     end
#     # end

# end