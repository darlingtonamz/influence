class Brand < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :campaigns
  belongs_to :user

end
