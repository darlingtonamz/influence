class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.references 	:ambassador, index: true,
                    foreign_key: true
      t.string :source
      t.timestamps
    end
  end
end
