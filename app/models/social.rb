class Social < ActiveRecord::Base
  belongs_to :user
  # named_scope :by_author, lambda {|author| {:conditions => {:author_id => author.id}}}
end
