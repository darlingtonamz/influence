class AmbassadorsController < ApplicationController
  layout false
  def index
    if (!current_user)
      redirect_to "/"
    end

    @ambassadors = Ambassador.find_all_by_user_id(params[:user_id]);
    @user_id = params[:user_id];
  end

  def new
  end

  def show
   render "ambassadors/campaigns"
  end
end
