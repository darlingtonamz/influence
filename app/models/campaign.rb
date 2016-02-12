class Campaign < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :brand
  has_many :ambassadors
  has_many :campaign_countries
end
