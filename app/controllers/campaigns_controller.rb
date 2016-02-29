class CampaignsController < ApplicationController
  layout false
  def index
    @brand = Brand.find(params[:brand_id])
    @campaigns = @brand.campaigns
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @campaign = Campaign.find_by_id(params[:id])
    @ambassadors = @campaign.ambassadors
    @user = current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @countries = Country.all
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.build
    @interests = Interest.all
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.build(campaign_param)
    @campaign.countries.push(Country.find_by_iso('GH'))
    puts '#'*100
    puts campaign_param

    if @campaign.save
      redirect_to '/brands'
    else
      render :new
    end
  end

  def edit
    @campaign = Campaign.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def stats
    @campaign = Campaign.find(params[:campaign_id])
    respond_to do |format|
      format.js
    end
  end

  def invite
    @campaign = Campaign.find(params[:campaign_id])
    @ambassador = Ambassador.new
    @users = User.role('influencer')
    respond_to do |format|
      format.js
    end
  end

  private
    def campaign_param
      params.require(:campaign).permit(:name, :url, :description, interest_ids: [])
    end

    def interest_arr
      params.require(:campaign).permit(interests: [])
    end

end
