class BrandsController < ApplicationController
  def index
    if (!current_user)
      redirect_to "/"
    end

    @brands = Brand.find_all_by_user_id(params[:user_id]);
    @user_id = params[:user_id];
  end

  def new
  end

  def show
  end
end
