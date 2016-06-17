class PoisController < ApplicationController
  private

  def object_params
    params.require(:poi).permit(:name, :latitude, :longitude,
                                :address, :luna_id, :category, :city, :state)
  end
end
