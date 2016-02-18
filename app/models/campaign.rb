class Campaign < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :brand
  has_many :ambassadors
  has_and_belongs_to_many :countries

  attr_accessible :name, :description, :url, :country_ids
end
