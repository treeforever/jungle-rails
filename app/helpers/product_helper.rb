module ProductHelper
  def average_rating(product)
    pluralize (product.reviews.sum(:rating) / product.reviews.length).round(1), 'star'
  end
end
