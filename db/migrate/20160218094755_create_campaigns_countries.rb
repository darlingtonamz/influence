class CreateCampaignsCountries < ActiveRecord::Migration
  def change
    create_table :campaigns_countries, id: false do |t|
      t.belongs_to :campaign, index: true
      t.belongs_to :country, index: true
    end
  end
end
