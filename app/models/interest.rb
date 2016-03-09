class Interest < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :users
  has_many :campaigns
end
