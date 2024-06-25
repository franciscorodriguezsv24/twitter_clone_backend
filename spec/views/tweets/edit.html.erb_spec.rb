require 'rails_helper'

RSpec.describe "tweets/edit", type: :view do
  let(:tweet) {
    Tweet.create!()
  }

  before(:each) do
    assign(:tweet, tweet)
  end

  it "renders the edit tweet form" do
    render

    assert_select "form[action=?][method=?]", tweet_path(tweet), "post" do
    end
  end
end
