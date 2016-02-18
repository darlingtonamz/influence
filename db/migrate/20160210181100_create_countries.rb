class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :iso, primary_key: true, index: true
      t.string :name
      t.string :nicename
      t.string :iso3
      t.string :numcode
      t.string :phonecode
      t.timestamps
    end
  end
end

