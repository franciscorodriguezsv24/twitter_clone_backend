require 'rails_helper'

RSpec.describe Follower, type: :model do

  describe 'associations' do 
  it {should belong_to(:follower).class_name('User')}
  it {should belong_to(:followee).class_name('User')}
  end 

  it 'return a follower' do 
    follower = FactoryBot.create(:follower)
  end 

  describe "validations" ,validate: true do 
    let!(:existing_follower) { FactoryBot.create(:follower) } 
    it{ should validate_uniqueness_of(:follower_id).scoped_to(:followee_id)}
  end

  describe 'follow_scopes' do 
      let (:user1) {create(:user)}
      let (:user2) {create(:user)}
      let (:user3) {create(:user)}
      let!(:follower1) { create(:follower, follower_id: user1.id) }
      let!(:follower2) { create(:follower, follower_id: user1.id) }
      let!(:follower3) { create(:follower, follower_id: user2.id) }

      before do 
        create_list(:follower, 3, followee: user2)
        create_list(:follower, 2, followee: user3)
      end

  describe 'follower user' do 
      it 'returns a number of followers'do 
        followers_count_user1 = Follower.followers_user(user1.id)
        expect(followers_count_user1).to eq(2)

        followers_count_user2 = Follower.followers_user(user2.id)
        expect(followers_count_user2).to eq(1)
      end
    end 

  describe 'followee user'
      it 'returns the count of followers for a specific followee' do
        followers_count_for_user2 = Follower.followee_user(user2.id)
        expect(followers_count_for_user2).to eq(3)

        followers_count_for_user3 = Follower.followee_user(user3.id)
        expect(followers_count_for_user3).to eq(2)
      end
    end
  end 


