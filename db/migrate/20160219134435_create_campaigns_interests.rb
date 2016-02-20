class CreateCampaignsInterests < ActiveRecord::Migration
  def change
    create_table :campaigns_interests, id: false do |t|
      t.references :campaign
      t.references :interest
      t.timestamps
    end
  end
end
