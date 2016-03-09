class DropCampaignInterestAnd < ActiveRecord::Migration
  def change
    drop_table :campaigns_interests
    add_column :ambassadors, :status, :text
  end
end
