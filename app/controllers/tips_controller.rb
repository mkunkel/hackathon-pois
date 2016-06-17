class TipsController < ApplicationController
  private

  def object_params
    params.require(:tip).permit(:poi_id, :luna_id, :text)
  end
end
