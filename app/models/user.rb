class User < ActiveRecord::Base
  scope :role, -> (role) { where role: role }
  #scope :interests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :brands
  has_many :ambassadors
  has_and_belongs_to_many :interests
  has_many :socials
end
