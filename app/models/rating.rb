class Rating < ApplicationRecord
  belongs_to :project

  validates :rate, numericality: {only_integer: true, greater_than: 0, less_than: 6}
  validates :testimony, length: {maximum: 200}, allow_blank: true
  validates :project_id, presence: true
end
