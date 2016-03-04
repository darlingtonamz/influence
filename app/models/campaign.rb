class Campaign < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :brand
  has_many :ambassadors
  has_and_belongs_to_many :countries
  belongs_to :interest
  has_many   :ambassador_requests
  has_many :impressions, through: :ambassadors

  mount_uploader :image, ImageUploader

  attr_accessible :name, :description, :url, :country_ids, :interest, :image, :tag
end
