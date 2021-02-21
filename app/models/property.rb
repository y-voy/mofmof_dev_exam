class Property < ApplicationRecord
  validates :name, presence: true, length: { in: 1..30 }
  validates :rent, presence: true, length: { in: 1..10 }
  validates :address, presence: true, length: { in: 1..30 }
  validates :age, presence: true, length: { maximum: 2 }

  has_many :nearest_stations, dependent: :destroy, inverse_of: :property
  accepts_nested_attributes_for :nearest_stations, allow_destroy: true, reject_if: :all_blank
end
