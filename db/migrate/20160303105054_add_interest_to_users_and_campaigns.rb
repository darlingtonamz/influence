class AddInterestToUsersAndCampaigns < ActiveRecord::Migration
  def change
    add_column :users, :interest_id, :integer
    add_column :campaigns, :interest_id, :integer
  end
end
