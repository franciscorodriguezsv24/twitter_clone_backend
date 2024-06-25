require 'rails_helper'

RSpec.describe "Registrations", type: :request do

    describe "POST/registrations" do
    let(:valid_attributes) { attributes_for(:user) }

    #let(:valid_params){valid_params(:user)}

    #let(:token){Api::JsonWebToken.encode(id: user.id)}

            context "a valid user to sign_up" do 
                it "returns 201 status response for creating a new session" do
                    post api_sign_up_path, params: {user: valid_attributes }

                    expect(response).to have_http_status(200)
                end 
                it "returns a JSON with authentication token" do
                    post api_sign_up_path, params: { user: valid_attributes }
                    
                    expect(response).to have_http_status(:ok)
                    json = JSON.parse(response.body)
                    expect(json['token']).to be_present
                end
            end 
        end
    end

