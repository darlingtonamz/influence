class Country < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :campaign_countries
end
