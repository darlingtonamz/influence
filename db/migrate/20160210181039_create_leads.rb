class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.references 	:ambassador, index: true,
                    foreign_key: true
      t.string :source
      t.timestamps
    end
  end
end
