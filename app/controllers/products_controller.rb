class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

  def top
    @products = Product.all.order(price_cents: :desc)
  end


end
