class Rating < ApplicationRecord
  belongs_to :project

  # validates :rating, presence: true, length: {minimum: 0, maximum: 10}
  validates :rate, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates_length_of :testimony, in: 1..500, allow_blank: true
  validates :project_id, presence: true
end
