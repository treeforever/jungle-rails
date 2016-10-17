require 'rails_helper'

RSpec.describe Product, type: :model do
  context "Validations" do
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_presence_of(:price) }
    # it { is_expected.to validate_presence_of(:quantity) }
    # it { is_expected.to validate_numericality_of(:category) }
  # end

  before do
    @category=Category.create(name: "Electronics")
  end

  it "should have name, category, price and quantity" do
    @product = Product.create(
      name: "Lipstick",
      category: @category,
      price: 230,
      quantity: 400
    )
    expect(@product).to be_valid
  end
end

end
