class ChangeUidColumnInSocialsToString < ActiveRecord::Migration
  def change
    change_column :socials, :uid,  :string
  end
end
