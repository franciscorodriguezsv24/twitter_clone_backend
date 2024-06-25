require 'rails_helper'
require 'shoulda/matchers'
RSpec.describe Like, type: :model do
  describe 'association' do
    it{should belong_to(:tweet)}
    it{should belong_to(:user)} 

  end 

  it 'return a like' do 
    like = create(:like)
  end 

  describe 'validation'do 
    let!(:existing_tweet) { FactoryBot.create(:like) }

    it { should validate_uniqueness_of(:tweet_id).scoped_to(:user_id) }
  end 

  #methods 
  describe ' like scopes ' do 
    let(:user1){create(:user)}
    let(:tweet1){create(:tweet, user: user1)}
    let(:like1){create(:like, tweet: tweet1, user: user1)}

    before do 
      create_list(:like, 3, user: user1,)
    end

    describe 'create a new Like', like: true do 
      it 'Creating a new like' do 
        user_id = user1.id
        tweet_id = tweet1.id

        like_for_user = Like.liked(tweet_id, user_id)
        expect(like_for_user).to have_attributes(:tweet_id => tweet_id, :user_id => user_id)
      end
    end

    describe 'delete a like', unlike: true do 
      it 'Deleting a like' do 
        like_id = like1.id     
        user_id = user1.id
        tweet_id = tweet1.id

        delete_like = Like.disliked(like_id)
        expect(delete_like).to have_attributes(:tweet_id => tweet_id, :user_id => user_id)

      end 
    end 


  end 
end
