class ReviewsController < ApplicationController

  def new
  end

  def create
    if current_user
      # @product = Product.find( params[:product_id])
      product_id = params[:product_id]
      @review = Review.new(product_id: params[:product_id].to_i, rating: params[:rating], description: params[:review][:description])
      @review.user_id = current_user.id

      if @review.save
        redirect_to("/products/#{product_id}")
      else
        redirect_to("/products/#{product_id}")
      end
    end
  end

  def destroy
    # if current_user
      @review = Review.find params[:id]
      product_id = @review.product_id
      @review.destroy
      redirect_to :back
    # end
  end

  def before_filter
    if current_user
      true
    end
  end
end
