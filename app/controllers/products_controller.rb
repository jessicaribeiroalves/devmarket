class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product_1 = Product.find_by(option: "Basic Website")
    @product_2 = Product.find_by(option: "Ecommerce Website")
    @product_3 = Product.find_by(option: "Blog Site")
  end

  
end