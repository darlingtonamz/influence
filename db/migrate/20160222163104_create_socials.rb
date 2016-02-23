class CreateSocials < ActiveRecord::Migration
  def change
    create_table :socials do |t|
      t.string :provider, primary_key: true
      t.integer :uid
      t.references :user
      t.timestamps
    end
  end
end
