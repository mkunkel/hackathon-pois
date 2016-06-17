class TipsController < ApplicationController
  def index
    @tips = Tip.limit(limit).offset(offset)
    render json: @tips.map(&:to_h)
  end

  def show
    render json: Tip.find(params[:id]).to_h
  end

  def create
    @tip = Tip.create(tip_params)
    render json: @tip.to_h
  end

  def update
    @tip = Tip.find(params[:id]).update(tip_params)
    render json: @poi.to_hash
  end

  def destroy
    Tip.find(params[:id]).destroy
    render json: {}
  end

  private

  def tip_params
    params.require(:tip).permit(:poi_id, :luna_id, :text)
  end
end
