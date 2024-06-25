require 'rails_helper'
require 'debug'

RSpec.describe User, type: :model do
  
  describe 'associations' do 
    it {should have_many(:followers).with_foreign_key('follower_id')}
    it {should have_many(:followees).with_foreign_key('followee_id')}
    it {should have_many(:tweets)}
    it {should have_many(:likes)}
    it {should have_many(:bookmarks)}
  end

  it 'returns a user' do 
    user = create(:user)
  end


  describe 'validations' do
    # Setup (optional, but recommended)
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    before(:each) { @user = User.new }  # Create a new User instance before each test

    it { should validate_presence_of(:username) }  # Username must be present
    it { should validate_uniqueness_of(:username) }  # Username must be unique (case-sensitive)
  
    it { should validate_presence_of(:name) }  # Name must be present
    it { should validate_presence_of(:lastname) }  # Last name must be present
  
    it { should validate_presence_of(:email) }  # Email must be present
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }  # Email must be unique (case-sensitive)
    it { should allow_value('valid_Password123@').for(:password).with_message("Your password is correct") }  # Allow valid password format
  end

  describe "password" do
    subject { User.new(email: "test@example.com", username: "testuser", name: "Test", lastname: "User") }
  
    it { should validate_length_of(:password).is_at_least(12).with_message("Password must be at least 12 characters") }
  end
  
  describe "email" do
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    subject { User.new(email: "test@example.com", username: "testuser", name: "Test", lastname: "User", password: "securepassword123") }
  
    it { should allow_value("test@example.com").for(:email).with_message("email format acepted") }
    it { should_not allow_value("invalid_email").for(:email).with_message("Invalid email format") }
  end

end