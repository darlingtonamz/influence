class Ambassador < ActiveRecord::Base
  attr_accessible :user_id, :campaign_id, :status
  belongs_to :user
  belongs_to :campaign
  has_many   :leads
  has_many   :impressions
  has_many   :ambassador_requests
end
