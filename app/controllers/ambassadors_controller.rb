class AmbassadorsController < ApplicationController
  layout false
  def index
    if (!current_user)
      redirect_to "/"
    end
    @ambassadors = Ambassador.find_all_by_user_id(params[:user_id]);
    @user_id = params[:user_id];

    if current_user.socials.count > 0
      if current_user.socials.where(provider: "instagram").where("followers <> ''")
        client = current_user.socials.where(provider: "instagram").first
        uid = client.uid.to_i
        access_token = current_user.socials.where(provider: "instagram").first.access_token
        
        response2 = HTTParty.get("https://api.instagram.com/v1/users/#{uid}/?access_token=#{access_token}");
        client.followers = response2['data']['counts']['followed_by']
        client.save
      end
    end
  end

  def new
  end

  def create
    @ambassador = Ambassador.new(ambassador_param)
    if @ambassador.save
      respond_to do |format|
        format.js
      end
    else
      head :bad_request
    end
  end

  def show
    @invites = Ambassador.where(user_id: current_user, status: 'pending')
    render "ambassadors/campaigns"
  end

  def update
    @ambassador = Ambassador.find(params[:id])
    if @ambassador.update_attributes(ambassador_param)
      respond_to do |format|
        format.js
      end
    end
  end

  def instagram_redirect
    options = {
      body: {
        client_id: 'fdaf0607c4c04ac5b0dd5c2e30f56fd3',
        client_secret: '2632323495fc4e2ea569dba394853736',
        grant_type: 'authorization_code',
        redirect_uri: 'http://localhost:3000/instagram_redirect',
        code: params[:code]
      }
    }

  response = HTTParty.post('https://api.instagram.com/oauth/access_token', options)
  
  social = Social.new
    social.provider = "instagram"
    social.user_id = current_user.id
    social.access_token = response['access_token']
    social.uid = response['user']['id']
    social.username = response['user']['username']
    social.bio = response['user']['bio']
    social.photo = response['user']['profile_picture']
    social.full_name = response['user']['full_name']

    current_user.socials << social

    #current_user.save
    redirect_to ambassadors_path
  end

  private
    def ambassador_param
      params.require(:ambassador).permit(:user_id, :campaign_id, :status)
    end
end
