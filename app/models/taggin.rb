class Taggin < ApplicationRecord
  belongs_to :tweet
  belongs_to :hastag
end
