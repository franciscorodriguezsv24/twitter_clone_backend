require 'rails_helper'

RSpec.describe Hastag, type: :model do
  describe 'associations' do
    it {should have_many(:taggins)}
   end 
 
   it 'return a hastag' do
   hastag = create(:hastag)
   end 
   
   describe 'validation' do 
    it {should validate_presence_of(:name) }
   end 
end
