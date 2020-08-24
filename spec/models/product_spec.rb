require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    new_product = Product.create(
                  name: "Best Table",
                  price: 10,
                  quantity: 0,
                  category_id: 1)

    it "has a name field" do
      # new_product.name = nil
      expect(new_product.name).to be_truthy
    end
    it "has a price" do
      # new_product.price = nil
      expect(new_product.price).to be_truthy
    end
    it "has a quantity" do
      # new_product.quantity = nil
      expect(new_product.quantity).to be_truthy
    end
    it "has a category" do
      # new_product.category = nil
      expect(new_product.category_id).to be_truthy
    end

  end
end
