class Impression < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :ambassador
  belongs_to :campaign
end
