class Product < ApplicationRecord
  enum status: { landing_page: 0, blog: 1, ecommerce: 2 }
  has_many :projects
end
