class CreateAmbassadors < ActiveRecord::Migration
  def change
    create_table :ambassadors do |t|
      t.references 	:user, index: true,
                    foreign_key: true
      t.references 	:campaign, index: true,
                    foreign_key: true
      t.timestamps
    end
  end
end
