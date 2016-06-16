class ImagesController < ApplicationController
  def index
    @images = Image.limit(limit).offset(offset)
    render json: @images.map(&:to_h)
  end

  def show
    render json: Image.find(params[:id])
  end

  def create
    @image = Image.save(poi_params)
    render json: @image.to_h
  end

  private

  def poi_params
    params.require(:image).permit(:image, :poi_id, :luna_id)
  end
end
