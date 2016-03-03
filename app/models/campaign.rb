class Campaign < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :brand
  has_many :ambassadors
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :interests
  has_many   :ambassador_requests
  has_many :impressions, through: :ambassadors

  mount_uploader :image, ImageUploader

  attr_accessible :name, :description, :url, :country_ids, :interest_ids, :image, :tag
end
