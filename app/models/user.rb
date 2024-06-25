class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  has_many :followers, foreign_key: 'follower_id'
  has_many :followees, foreign_key: 'followee_id', class_name: 'Follower'
  has_many :tweets
  has_many :likes
  has_many :bookmarks

# validations 
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :name, presence: true
  validates :lastname, presence: true 
  validates :email, presence: true, confirmation: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Invalid email format" }
  validates :email, uniqueness: true
  validates :password, format: { with: /\A.../ }
  validates :password, length: { minimum: 12, message: "Password must be at least 12 characters" }
end
