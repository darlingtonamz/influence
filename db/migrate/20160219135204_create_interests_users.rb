class CreateInterestsUsers < ActiveRecord::Migration
  def change
    create_table :interests_users, id: false do |t|
      t.references :user
      t.references :interest
      t.timestamps
    end
  end
end
