class Hastag < ApplicationRecord
    has_many:taggins 
    validates :name, presence: true

end
