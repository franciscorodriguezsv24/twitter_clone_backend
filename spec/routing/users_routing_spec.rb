require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
      it "routes tweet to the user controller" do
        expect(get("/users/1/tweets/")).
          to route_to("users#tweets", id:'1')
      end 

      it "routes tweet and replies to the user controller" do 
        expect(get("/users/1/tweets_replies")).
          to route_to("users#tweets_replies", id: '1')
      end 
  end
end
