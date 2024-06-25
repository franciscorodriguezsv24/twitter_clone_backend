require 'rails_helper'

RSpec.describe Taggin, type: :model do
  describe 'association' do
    it{should belong_to(:tweet)}
    it{should belong_to(:hastag)}
  end
end
