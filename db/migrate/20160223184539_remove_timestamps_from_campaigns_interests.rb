class RemoveTimestampsFromCampaignsInterests < ActiveRecord::Migration
  def up
    remove_column :campaigns_interests, :created_at
    remove_column :campaigns_interests, :updated_at
  end

  def down
    add_column :campaigns_interests, :updated_at, :string
    add_column :campaigns_interests, :created_at, :string
  end
end
