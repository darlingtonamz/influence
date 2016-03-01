class Impression < ActiveRecord::Base
  attr_accessible :source, :ambassador_id, :hover_time, :view_time, :city, :country, :ip, :region, :coord

  belongs_to :ambassador
  belongs_to :campaign
end
