class Tip < ActiveRecord::Base
  belongs_to :poi

  def to_h
    {
      id: id,
      poi_id: poi_id,
      luna_id: luna_id,
      text: text
    }
  end
end
