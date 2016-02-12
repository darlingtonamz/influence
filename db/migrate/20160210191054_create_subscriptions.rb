class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :email
      t.boolean :is_brand
      t.timestamps
    end
  end
end
