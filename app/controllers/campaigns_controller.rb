class CampaignsController < ApplicationController

  def index

  end

  def show
    @campaign = Campaign.find_by_id(params[:id])
    @ambassadors = @campaign.ambassadors
    @user = current_user
  end

  def new
    @countries = Country.all
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.build
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.build(campaign_param)
    @campaign.countries.push(Country.find_by_iso('GH'))

    if @campaign.save
      redirect_to '/brands'
    else
      render :new
    end
  end

  private
    def campaign_param
      params.require(:campaign).permit(:name, :url, :description)
    end

    def country_ids
      params.require(:campaign).permit(:country_ids)
    end

end
