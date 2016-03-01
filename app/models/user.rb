class User < ActiveRecord::Base
  scope :role, -> (ambassador_id) { where.not(:mid => Ambassador.select(ambassador_id).uniq) }
  scope :is_influencer, -> { where(role: 'influencer') }
  #scope :interests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body

  has_many :brands
  has_many :ambassadors
  has_and_belongs_to_many :interests
  has_many :socials
end
