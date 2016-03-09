class InstagramPost < ActiveRecord::Base
  attr_accessible :uid, :username, :caption, :comments, :likes, :link, :image, :created_at
  belongs_to :campaign
end
