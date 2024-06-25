require 'rails_helper'

RSpec.describe Tweetreply, type: :model do
  describe 'association' do
    it{should belong_to(:tweet)}
    it{should belong_to(:user)}
  end
  

end
