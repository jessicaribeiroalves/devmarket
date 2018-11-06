class ProductsController < ApplicationController
  def index
    @products = Product.all
    @product_1 = Product.find(1)
    @product_2 = Product.find(2)
    @product_3 = Product.find(3)
  end

end