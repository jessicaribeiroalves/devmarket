class ProductsController < ApplicationController
  def index
    @products = Product.all

    @images = [{
      url: "https://s3-ap-southeast-2.amazonaws.com/dev-market-auz/product_3_landing_page",
      alt: "product image for landing page site",
    }, {
      url: "https://s3-ap-southeast-2.amazonaws.com/dev-market-auz/product_1_ecommerce",
      alt: "product image for ecommerce site",
    }, {
      url: "https://s3-ap-southeast-2.amazonaws.com/dev-market-auz/product_2_blog",
      alt: "product image for blog site",
    }]
  end
end
