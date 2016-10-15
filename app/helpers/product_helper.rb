module ProductHelper
  def average_rating(product)
    pluralize (product.review.sum(:rating) / product.review.length).round(1), 'star'
  end
end
