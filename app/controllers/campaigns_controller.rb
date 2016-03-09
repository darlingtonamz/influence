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

  def destroy
    @campaign = Campaign.find_by_id(params[:id])
    if @campaign.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  def new
    @countries = Country.all
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.build
    @interests = Interest.all
    respond_to do |format|
      format.js
    end
  end

  def create
    @brand = Brand.find(params[:brand_id])
    @campaign = @brand.campaigns.build(campaign_param)
    @campaign.interest_id = params[:campaign][:interest].to_i
    @campaign.countries.push(Country.find_by_iso('GH'))
    puts '#'*100
    puts campaign_param

    respond_to do |format|
      if @campaign.save
        format.js{render "index"}
      else
        format.js{render :new}
      end
    end
  end

  def edit
    @brand = Brand.find(params[:brand_id])
    @campaign = Campaign.find_by_id(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_param)
      respond_to do |format|
        format.js{render 'show'}
      end
    end
  end

  def stats
    @campaign = Campaign.find(params[:campaign_id])
    @impressions = @campaign.impressions
    @ambassadors = Ambassador.where(campaign_id: @campaign.id, status: 'accepted')
    @reach = 0
    @ambassadors.each do |a|
      @reach += a.user.socials.first.followers.to_i
    end
    respond_to do |format|
      format.js
    end
    @campaign.save_data_from_api
  end

  def invite
    @campaign = Campaign.find(params[:campaign_id])
    @ambassador = Ambassador.new
    @invited = @campaign.ambassadors
    @users = User.find_by_sql("SELECT * FROM users WHERE role = 'influencer' AND id NOT IN (SELECT user_id FROM ambassadors WHERE campaign_id = "+@campaign.id.to_s+") AND id IN (SELECT user_id FROM socials)")
    respond_to do |format|
      format.js
    end
  end

  private
    def campaign_param
      params.require(:campaign).permit(:name, :url, :description, :image, :tag)
    end

    def interest_arr
      params.require(:campaign).permit(interests: [])
    end

end
