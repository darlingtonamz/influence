class CampaignCountry < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :country
  belongs_to :campaign
end
