class Admin::CategoriesController < ApplicationController
  # http_basic_authenticate_with :name => "Jungle",
  #                              :password => "book"

  # CodeReview: you can use a before_filter for common things
  # before_filter :load_category, only: [:update, :destroy]


  http_basic_authenticate_with :name => Rails.configuration.admin[:username],
                             :password => Rails.configuration.admin[:password]

  def index
    # CodeReview no need to include .all
    # @categories = Category.order(id: :desc).all
    # CodeReview consider using scopes
    @categories = Category.order_by_id_desc
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

  #CodeReviewNotes: better to put path helper
    if @category.save
      redirect_to admin_category_path(@category.id), notice: 'Category created!'
    else
      render :new
    end
  end

  def update
    @category = Category.find params[:id]

    if @category.update(category_params)
      redirect_to [:admin, :categories], notice: 'Category updated!'
    else
      render :show
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

  def load_category
    @category = Category.find params[:id]
  end

end
