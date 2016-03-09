class AddDataToImpressions < ActiveRecord::Migration
  def change
    add_column :impressions, :ip, :string
    add_column :impressions, :view_time, :integer, default: 0
    add_column :impressions, :hover_time, :integer, default: 0
    add_column :impressions, :city, :string
    add_column :impressions, :region, :string
    add_column :impressions, :country, :string
    add_column :impressions, :coord, :string
  end
end
