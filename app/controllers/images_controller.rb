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
    set_ocr_text
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

  def set_ocr_text
    begin
      api_key = ENV['OCR_API_KEY']
      api_url = URI('https://api.ocr.space/parse/image')
      response = Net::HTTP.post_form(api_url, apikey: api_key, url: @image.image.url)
      @image.ocr_text = JSON.parse(response.body)['ParsedResults'].first['ParsedText']
      @image.save
    rescue StandardError
      nil
    end
  end
end
