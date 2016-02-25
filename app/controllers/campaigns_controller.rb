class CampaignsController < ApplicationController
  layout false
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

  def invite
    @campaign = Campaign.find(params[:campaign_id])
    #@user = User.role('influencer').interest(@campaign.interests)
    @users = User.role('influencer')
  end

  private
    def campaign_param
      params.require(:campaign).permit(:name, :url, :description, interest_ids: [])
    end

    def interest_arr
      params.require(:campaign).permit(interests: [])
    end

end
