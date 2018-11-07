class Product < ApplicationRecord
  has_many :projects

  # Validation
  validates :option,
            presence: true,
            length: {maximum: 100},
            on: :create,
            allow_nil: false

  validates :price,
            presence: true,
            numericality: true,
            length: {maximum: 10},
            on: :create,
            allow_nil: false

  validates :duration,
            presence: true,
            numericality: true,
            length: {maximum: 2},
            on: :create,
            allow_nil: false

  validates :description,
            presence: true,
            length: {maximum: 1000},
            on: :create,
            allow_nil: false
end
