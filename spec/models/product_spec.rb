require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do 
    before(:each) do 
      @category = Category.new name: 'Ferns'
      @product = Product.new(name: "Autumn Fern", price_cents: 500, quantity: 3, category: @category)
    end 

    it "saves with fields completed" do 
      @product.save!
      expect(@product).to be_valid
    end   
    
    it "validates :name, presence: true" do
      @product.name = nil
      expect(@product).to_not be_valid 
      expect(@product.errors.messages[:name]).to include('can\'t be blank')
    end  
    it "validates :price, presence: true" do
      @product.price_cents = nil
      expect(@product).to_not be_valid  
      expect(@product.errors.messages[:price_cents]).to include('is not a number')
    end 
    it "validates :quantity, presence: true" do
      @product.quantity = nil
      expect(@product).to_not be_valid  
      expect(@product.errors.messages[:quantity]).to include('can\'t be blank')
    end 
    it "validates :category, presence: true" do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.messages[:category]).to include('can\'t be blank')  
    end 
  end 
end

