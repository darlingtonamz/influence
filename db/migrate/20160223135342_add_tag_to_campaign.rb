class AddTagToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :tag, :text
  end
end
