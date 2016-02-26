class Brand < ActiveRecord::Base
  validates :name, presence: true
  validates :description,  presence: true

  has_many :campaigns
  belongs_to :user

  attr_accessible :name, :description
end
