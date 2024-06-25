require 'rails_helper'

RSpec.describe Bookmark, type: :model do
   describe 'association' do 
      it {should belong_to(:tweet)}
      it {should belong_to(:user)}
   end

   describe "validations" do
      let(:user1){create(:user)}
      let(:user2){create(:user)}
      let(:tweet){create(:tweet, user: user1)}
      let(:bookmark){create(:bookmark, tweet: tweet, user: user1)}
      before do 
         create_list(:bookmark, 3, user: user1,)
         create_list(:bookmark, 2, user: user2,)
      end

      describe 'bookmar_by_user scope' do
         it 'returns bookmarks a specific user' do 
            bookmarks_for_user1 = Bookmark.bookmark_by_user(user1.id)
            expect(bookmarks_for_user1.count).to eq(3)
            expect(bookmarks_for_user1).to all(have_attributes(user_id: user1.id))

            bookmarks_for_user2 = Bookmark.bookmark_by_user(user2.id)
            expect(bookmarks_for_user2.count).to eq(2)
            expect(bookmarks_for_user2).to all(have_attributes(user_id: user2.id))
         end
      end

      describe 'tweets_with_bookmark' do 
         it 'returns the tweet with bookmark' do
           tweet_id = tweet.id 
           tweet_with_bookmark = Bookmark.tweets_with_bookmark(tweet_id)
           expect(tweet_with_bookmark).to all(have_attributes(tweet_id: tweet_id))
         end
      end 

      describe 'method create a bookmark' do 
         it 'returns a new bookmark' do 
            tweet_id = tweet.id
            user_id = user1.id

            tweet_bookmarked = Bookmark.bookmarked(tweet_id, user_id)
            expect(tweet_bookmarked).to have_attributes(:tweet_id => tweet_id, :user_id => user_id)

         end 
      end 

   end
end
