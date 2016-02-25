class AddSocialFieldsToSocialAndRemoveFromUser < ActiveRecord::Migration
  def change
  	add_column :socials, :access_token, :text
    add_column :socials, :username, :text
    add_column :socials, :bio, :text
    add_column :socials, :photo, :text
    add_column :socials, :full_name, :text
    add_column :socials, :followers, :text

    remove_column :users, :ig_access_token
    remove_column :users, :ig_id
    remove_column :users, :ig_username
    remove_column :users, :ig_bio
    remove_column :users, :ig_photo
    remove_column :users, :ig_full_name
  end
end
