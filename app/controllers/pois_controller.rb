class PoisController < ApplicationController
  def index
    @pois = Poi.limit(limit).offset(offset)
    render json: @pois.map(&:to_h)
  end

  def show
    render json: Poi.find(params[:id]).to_h
  end

  def create
    @poi = Poi.create(poi_params)
    render json: @poi.to_h
  end

  def update
    @poi = Poi.find(params[:id]).update(poi_params)
    render json: @poi.to_hash
  end

  def destroy
    Poi.find(params[:id]).destroy
    render json: {}
  end

  private

  def poi_params
    params.require(:poi).permit(:name, :latitude, :longitude,
                                :address, :luna_id, :category, :city, :state)
  end

  def limit
    params[:limit] || 10
  end

  def offset
    params[:offset] || 0
  end
end
