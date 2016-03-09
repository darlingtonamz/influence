class BrandsController < ApplicationController
  layout false
  def index
    if (!current_user)
      redirect_to "/"
    else
      @brands = current_user.brands
      @user_id = current_user.id
      puts '#'*100
      puts @brands
    end
  end

  def brand_list
    @brands = current_user.brands
    puts '~'*100
    puts @brands
    respond_to do |format|
      format.js{render "index"}
    end
  end

  def new
    @brand = Brand.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @brand = Brand.new(brand_param)
    @brand.user_id = current_user.id
    respond_to do |format|
      if @brand.save
        @brands = current_user.brands
        format.js { render "index"}
      else
        format.js { render "error"}
      end
    end
  end

  def show
    @brand = Brand.find_by_id(params[:id])
    @campaigns = Campaign.find_all_by_brand_id(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @brand = Brand.find_by_id(params[:id])
    if @brand.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private
    def brand_param
      params.require(:brand).permit(:name, :description)
    end
end
