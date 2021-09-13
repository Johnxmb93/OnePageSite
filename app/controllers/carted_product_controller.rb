class CartedProductController < ApplicationController
  before_action :authenticate_user
  def index
    carted_products = CartedProduct.all
    render json: carted_products
  end

  def create
    carted_product = CartedProduct.new(
      product_id: params[:product_id],
      user_id: current_user.id,
    )
    if carted_product.save
      render json: post
    else
      render json: {errors: post.errors.full_messages},
      status: :unprocessable_entity
    end
  end

end
