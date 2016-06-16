class PoisController < ApplicationController
  def index
    @pois = Poi.limit(limit).offset(offset)
    render json: @pois.map(&:to_h)
  end

  def show
    render json: Poi.find(params[:id])
  end

  def create
    @poi = Poi.save(poi_params)
    render json: @poi.to_h
  end

  private

  def poi_params
    params.require(:poi).permit(:latitude, :longitude, :address, :luna_id, :category)
  end
end
