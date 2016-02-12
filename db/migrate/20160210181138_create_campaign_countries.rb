class CreateCampaignCountries < ActiveRecord::Migration
  def change
    create_table :campaign_countries do |t|
      t.references 	:country, index: true,
                    foreign_key: true
      t.references 	:campaign, index: true,
                    foreign_key: true
      t.timestamps
    end
  end
end
