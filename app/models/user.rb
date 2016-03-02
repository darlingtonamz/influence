class User < ActiveRecord::Base
  #scope :role, -> (ambassador_id) { where.not(:mid => Ambassador.select(ambassador_id).uniq) }
  scope :is_influencer, -> { where(role: 'influencer') }
  #scope :interests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
=begin
  before_validation :assign_roles
  def assign_roles
    puts '#'*100
    puts (role == "influencer")
    self.role = (role == "influencer") ? "influencer":"brand"
  end
=end

  has_many :brands
  has_many :ambassadors
  has_and_belongs_to_many :interests
  has_many :socials
end
