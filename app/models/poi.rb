class Poi < ActiveRecord::Base
  has_many :tips
  has_many :images

  def to_h
    {
      id: id,
      luna_id: luna_id,
      name: name,
      coordinates: {
        latitude: latitude,
        longitude: longitude
      },
      category: category,
      tips: tips.to_h,
      images: images.to_h
    }
  end
end
