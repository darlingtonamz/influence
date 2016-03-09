class AddInstagramTagIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :min_tag_id, :string
  end
end
