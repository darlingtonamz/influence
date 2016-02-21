class AddDataToImpressions < ActiveRecord::Migration
  def change
    add_column :impressions, :session_id, :string
    add_column :impressions, :clicks, :integer, default: 0
    add_column :impressions, :hover_time, :integer
    add_column :impressions, :country, :string
  end
end
