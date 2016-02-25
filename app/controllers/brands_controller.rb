class BrandsController < ApplicationController
  def index
    if (!current_user)
      redirect_to "/"
    else
      @brands = current_user.brands;
      @user_id = current_user.id;
    end
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_param)
    @brand.user_id = current_user.id
    if @brand.save
      redirect_to '/brands'
    else
      redirect_to '/brands/new'
    end
  end

  def show
    @brand = Brand.find_by_id(params[:id])
    @campaigns = @brand.campaigns
    respond_to do |format|
      format.js
    end
  end

  private
    def brand_param
      params.require(:brand).permit(:name, :description)
    end
end
