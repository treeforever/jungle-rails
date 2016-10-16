class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with :name => "Jungle",
                               :password => "book"

# http_basic_authenticate_with :name => Rails.configuration.admin[:username],
#                              :password => Rails.configuration.admin[:password]

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
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

end
