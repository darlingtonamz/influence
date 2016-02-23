class AddInstagramCredentialsToUser < ActiveRecord::Migration
  def change
    add_column :users, :ig_access_token, :text
    add_column :users, :ig_id, :text
    add_column :users, :ig_username, :text
    add_column :users, :ig_bio, :text
    add_column :users, :ig_photo, :text
    add_column :users, :ig_full_name, :text
  end
end
