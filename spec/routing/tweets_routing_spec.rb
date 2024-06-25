require "rails_helper"

RSpec.describe TweetsController, type: :routing do

  describe "routes for tweets" do
 
    it "routes stats to the tweets controller" do
      expect(get("/tweets/1/stats")).to route_to("tweets#stats", id: '1')
    end

    it "route like to the tweets controller" do 
        expect(post("/tweets/1/like")). 
        to route_to("tweets#liked", id: '1')
    end 

    it "route dislike to the tweets controller" do 
      
        expect(delete("/tweets/1/destroy")).
        to route_to("tweets#destroy", id: '1')
    end

    it "route retweet to the tweets controller" do 
        expect(post("/tweets/1/retweet")).
        to route_to("tweets#retweet", id: '1')
    end

    it "route quote to tweets controller" do 
        expect(post("/tweets/1/quote")).
        to route_to("tweets#create_quote_tweet", id: '1')
    end 

    it "route reply to tweets controller" do 
        expect(post("/tweets/1/reply")).
        to route_to("tweets#create_reply", id: '1')
    end 

    it "route bookmark to tweets controller" do 
      expect(post("/tweets/1/bookmark")).
      to route_to("tweets#bookmarked", id: '1')
    end 

    it "route tweet to tweets controller" do 
        expect(post("/tweets")).
        to route_to("tweets#create")
    end

    it "route new_tweet to tweets controller" do 
        expect(get("/tweets/new")).
        to route_to("tweets#new")
    end

    it "route tweet to tweets controller with patch" do 
        expect(patch("/tweets/1")).
        to route_to("tweets#update", id: '1')
    end

    it "route to tweets controller with put" do 
        expect(put("/tweets/1")).
        to route_to("tweets#update", id: '1')
    end
  end
end
