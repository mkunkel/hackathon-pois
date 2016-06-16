class ImagesController < ApplicationController
  def index
    @images = Image.limit(limit).offset(offset)
    render json: @images.map(&:to_h)
  end

  def show
    render json: Image.find(params[:id]).to_h
  end

  def create
    @image = Image.create(image_params)
    render json: @image.to_h
  end

  def update
    @image = Image.find(params[:id]).update(image_params)
    render json: @image.to_hash
  end

  def destroy
    Image.find(params[:id]).destroy
    render json: {}
  end

  private

  def image_params
    params.require(:image).permit(:image, :poi_id, :luna_id)
  end

  def limit
    params[:limit] || 10
  end

  def offset
    params[:offset] || 0
  end
end
