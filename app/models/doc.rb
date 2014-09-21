class Doc < ActiveRecord::Base
  validates :url, presence: true
end
