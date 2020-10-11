class BurritosInfo < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :address, presence: true, allow_blank: false
  validates :lat, presence: true, allow_blank: false, numericality: true
  validates :long, presence: true, allow_blank: false, numericality: true
  validates :category_id1, presence: true, numericality: { only_integer: true, greater_than: 1001,
                                                           less_than_or_equal_to: 1200 }
  validates :category_id2, presence: true, numericality: { only_integer: true, greater_than: 2000,
                                                           less_than_or_equal_to: 2200 }
  validates :closed, presence: true, allow_blank: false, inclusion: { in: [true, false] }
end
