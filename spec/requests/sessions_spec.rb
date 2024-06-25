require 'rails_helper'

RSpec.describe "Sessions", type: :request do

    describe "POST/sessions" do
    let(:user){create(:user)}
    let(:token){Api::JsonWebToken.encode(id: user.id)}

    context "a valid user to sign_in" do 
        it "returns 201 status response for creating a new session" do
            
            p user 
            
            post api_sign_in_path, params: {}, headers: {"Authorization": "Bearer #{token}"}

            expect(response).to have_http_status(201)
        end 
    end 
    
end



    
end

# context "with valid params" do
#     it 'returns 201 status response for creating a new tweet' do
#       post api_tweets_path, params: valid_params
#       puts response.body

#       expect(response).to have_http_status(:created)
#     end
#   end 

#   #DONE
#   describe "Tweet Creation" do
#     let(:user) { create(:user) }
#     let(:tweet_params) { { tweet: { tweet_body: "asdasdasd" ,user_id: user.id } } }
#     let(:token) { JsonWebToken.encode(sub: user.id)}
#     it "creates a new tweet and returns a 200 status with matching JSON schema" do
#       post api_tweets_path, params: tweet_params, headers: {"Authorization": "Bearer #{token}"}
#       expect(response).to have_http_status(201)
#       expect(response).to match_response_schema('tweet')
#     end
#   end