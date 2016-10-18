class ReviewsController < ApplicationController

  # CodeReview: use before_fiter or before_action for authorizing requests
  before_filter :authorize

  # CodeReview: If you're not doing anything in the method, you don't need to include it
  def new
  end

  def create
    @product = Product.find( params[:product_id])
    @review = @product.reviews.new(review_params)
    # product_id = params[:product_id]
    # @review = Review.new(product_id: params[:product_id].to_i, rating: params[:rating], description: params[:review][:description])
    @review.user_id = current_user.id

    if @review.save
      # CodeReview: Use the route path helpers
      # redirect_to product_path(@product.id)
      # CodeReview: If you are redirecting to the same place regardless of outcome
      # consider putting it outside the check and rendering error messages
      # like saying @review.error_messages in the show.html.erb file
      redirect_to("/products/#{product_id}")
    else
      redirect_to("/products/#{product_id}")
    end
  end

  def destroy
    @review = Review.find params[:id]
    product_id = @review.product_id
    @review.destroy
    redirect_to :back
  end

  # CodeReview: Not the way before_filter is used! :)
  def before_filter
    if current_user
      true
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
