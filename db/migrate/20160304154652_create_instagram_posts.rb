class CreateInstagramPosts < ActiveRecord::Migration
  def change
    create_table :instagram_posts do |t|
      t.references :campaign
      t.string  :uid
      t.string  :username
      t.string  :caption
      t.integer :comments
      t.integer :likes
      t.string  :link
      t.string  :image
      t.integer :created_at
    end
  end
end
