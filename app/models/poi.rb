class Poi < ActiveRecord::Base
  has_many :tips
  has_many :images

  def to_h
    {
      id: id,
      luna_id: luna_id,
      name: name,
      address: address,
      coordinates: {
        latitude: latitude,
        longitude: longitude
      },
      category: category,
      tips: tips.map(&:to_h),
      images: images.map(&:to_h)
    }
  end
end
