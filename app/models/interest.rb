class Interest < ActiveRecord::Base
  # attr_accessible :title, :body
  has_and_belongs_to_many :users
  has_and_belongs_to_many :campaigns
end