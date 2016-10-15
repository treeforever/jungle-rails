class ProductsController < ApplicationController
  helper ProductHelper
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

  def top
    @products = Product.all.order(price_cents: :desc)
  end


end
