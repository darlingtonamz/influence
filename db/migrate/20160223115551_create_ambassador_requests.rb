class CreateAmbassadorRequests < ActiveRecord::Migration
  def change
    create_table :ambassador_requests do |t|
      t.references :ambassador, index: true, foreign_key: true
      t.references :campaign, index: true, foreign_key: true
      t.string     :status
      t.timestamps
    end
  end
end
