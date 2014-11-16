class Doc < ActiveRecord::Base
  attr_accessible :url
  validates :user_id, presence: true
end
