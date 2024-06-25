require 'rails_helper'

RSpec.describe "Mains", type: :request do
  describe "GET /home" do
    it "returns http success" do
      get "/main/home"
      expect(response).to have_http_status(:success)
    end
  end

end


#DONE
describe "Tweet Creation" do
  let(:user) { create(:user) }
  let(:tweet_params) { { tweet: { tweet_body: "asdasdasd" ,user_id: user.id } } }
  let(:token) { JsonWebToken.encode(sub: user.id)}
  it "creates a new tweet and returns a 200 status with matching JSON schema" do
    post api_tweets_path, params: tweet_params, headers: {"Authorization": "Bearer #{token}"}
    expect(response).to have_http_status(201)
    expect(response).to match_response_schema('tweet')
  end
end