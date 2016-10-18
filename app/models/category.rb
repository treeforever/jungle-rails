class Category < ActiveRecord::Base

  has_many :products
  # CodeReview: consider using scopes for ordering/filtering a collection
  # as it keeps things neat/easier to read
  scope :order_by_id_desc, -> {order(id: :desc)}

end
