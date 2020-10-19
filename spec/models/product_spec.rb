require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "Validate name presence" do
      @category = Category.create(name: "testCategory")
      @product = Product.create(name: nil, quantity: 5, price: 500, category: @category) 
      # puts @product.errors.full_messages
      expect(@product.errors.full_messages.include?("Name can't be blank")).to eql(true)
    end

    it "Validate price" do
      @category = Category.create(name: "testCategory")
      @product = Product.create(price: nil, name: "testprice", quantity: 5, category: @category)
      # puts @product.errors.full_messages
      # puts "testing puts"
      expect(@product.errors.full_messages.include?("Price can't be blank")).to eql(true)
    end


    it "Validate quantity presence" do
      @category = Category.create(name: "testCategory")
      @product = Product.create(price: 500, name: "testquantity", quantity: nil, category: @category)
      # puts @product.errors.full_messages
      expect(@product.errors.full_messages.include?("Quantity can't be blank")).to eql(true)
    end

    it "Validate category presence" do
      @category = Category.create(name: "testCategory")
      @product = Product.create(price: 500, name: "testquantity", quantity: 5, category: nil)
      # puts @product.errors.full_messages
      expect(@product.errors.full_messages.include?("Category can't be blank")).to eql(true)
    end


  end
end
