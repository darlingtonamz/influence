class ImpressionsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    @impression = Impression.where(ip: impression_param[:ip], ambassador_id: params[:ambassador_id]).first
    respond_to do |format|
      if !@impression
        @impression = Impression.new(impression_param)
        @impression.ambassador_id = params[:ambassador_id]
        if @impression.save
          format.json { render status: :created, json: @impression }
        else
          head :bad_request
        end
      else
        hover = @impression.hover_time + impression_param[:hover_time].to_i
        view = @impression.view_time + impression_param[:view_time].to_i
        if @impression.update_attributes(hover_time: hover, view_time: view)
          format.json { render status: :created, json: @impression }
        else
          head :bad_request
        end
      end
    end
  end

  def update
    @impression = Impression.find(params[:id])
  end

  private
    def impression_param
      params.require(:impression).permit(:source, :ambassador_id, :hover_time, :view_time, :city, :country, :ip, :region, :coord)
    end
end
