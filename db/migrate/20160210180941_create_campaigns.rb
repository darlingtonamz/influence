class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.references 	:brand, index: true,
                    foreign_key: true
      t.string :name
      t.string :url
      t.string :description
      t.timestamps
    end
  end
end
