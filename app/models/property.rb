class Property < ApplicationRecord
  validates :name, presence: true, length: { in: 1..30 }
  validates :rent, presence: true, length: { in: 1..10 }
  validates :address, presence: true, length: { in: 1..30 }
  validates :age, presence: true, length: { maximum: 2 }

  has_many :nearest_stations, dependent: :destroy, inverse_of: :property
  accepts_nested_attributes_for :nearest_stations, allow_destroy: true, reject_if: :reject_both_blank

  def reject_both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:line].blank? and attributes[:station].blank? and attributes[:minute_walk].blank?
      !attributes[:line].blank? and attributes[:station].blank? and attributes[:minute_walk].blank?
    else
      attributes[:line].blank? and attributes[:station].blank? and attributes[:minute_walk].blank?
    end
  end

end
