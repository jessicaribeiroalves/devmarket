class Product < ApplicationRecord
  # enum option: {landing_page: 0, blog: 1, ecommerce: 2}  # need to discuss ERD and schema
  has_many :projects
end
