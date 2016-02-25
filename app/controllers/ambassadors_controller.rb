class AmbassadorsController < ApplicationController
  layout false
  def index
    if (!current_user)
      redirect_to "/"
    end
    @ambassadors = Ambassador.find_by_user_id(params[:user_id]);
    @user_id = params[:user_id];

=begin
    if current_user.ig_id.blank?
      response2 = HTTParty.get('https://api.instagram.com/v1/users/' + current_user.ig_id + '/?access_token='+ current_user.ig_access_token);
      puts "&" * 100
      session[:ig_followers] = response2['data']['counts']['followed_by']
    end
=end
  end

  def new
  end

  def show
   render "ambassadors/campaigns"
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
  

  current_user.ig_access_token = response['access_token']
  current_user.ig_id = response['user']['id']
  current_user.ig_username = response['user']['username']
  current_user.ig_bio = response['user']['bio']
  current_user.ig_photo = response['user']['profile_picture']
  current_user.ig_full_name = response['user']['full_name']

  current_user.save
  redirect_to ambassadors_path
end
end
