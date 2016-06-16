class Image < ActiveRecord::Base
  belongs_to :poi

  # styles TBD
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def to_h
    {
      id: id,
      poi_id: poi_id,
      luna_id: luna_id,
      image: image.url,
      ocr_text: ocr_text
    }
  end
end
