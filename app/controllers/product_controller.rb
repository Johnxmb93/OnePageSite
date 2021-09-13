class ProductController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    if product.save
      render json: product
    else
      render json: {errors: product.errors.full_message},
      status: 422
    end 
    product = Product.find_by(id: params[:id])
    render json: product
  end
end
