class Project < ApplicationRecord
  enum status: {cancelled: -1, open: 0, ongoing: 1, completed: 2}

  belongs_to :user
  belongs_to :product

  attribute :status, default: 0

  has_many :bids, dependent: :destroy
  has_one :rating, dependent: :destroy

  # Characters limit for project fields
  validates :title,
  presence: true,
  length: {maximum: 50},
  on: :create,
  allow_nil: false

  validates :overview,
  presence: true,
  length: {maximum: 500},
  on: :create,
  allow_nil: false

  validates :description,
  presence: true,
  length: {maximum: 1000},
  on: :create,
  allow_nil: false

end
