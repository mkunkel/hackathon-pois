class ImagesController < ApplicationController
  def create
    @image = Image.create(image_params)
    set_ocr_text
    render json: @image.to_h
  end

  private

  def object_params
    params.require(:image).permit(:image, :poi_id, :luna_id)
  end

  def set_ocr_text
    begin
      api_key = ENV['OCR_API_KEY']
      api_url = URI('https://api.ocr.space/parse/image')
      # If there is any information after a ? in a URL, OCRAPI sees the URL as invalid
      image_url = @image.image.url.split('?').first
      response = Net::HTTP.post_form(api_url, apikey: api_key, url: image_url)
      @image.ocr_text = JSON.parse(response.body)['ParsedResults'].first['ParsedText']
      @image.save
    rescue StandardError
      nil
    end
  end
end
