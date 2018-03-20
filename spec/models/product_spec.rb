require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'validates the striphtml of description' do
    category = Category.new(title: 'category');
    product = Product.new(title: 'title',price: 12, description:'<html>a</hmtl>')
    product.category = category
    product.save
    expect(product.description).to eq('a')
  end

  it 'validates lowercase' do
    category = Category.new(title: 'category');
    product = Product.new(title: 'TITLE',price: 12, description:'aabcdassd')
    product.category = category
    product.save
    expect(product.title).to eq('title')
  end

  it 'title is shorter than description' do
    category = Category.new(title: 'category');
    product = Product.new(title: 'abcde',price: 12, description:'abcd')
    product.category = category
    product.save
    expect(product.errors.messages).to include(description: ['can\'t be shorter than title'])
  end


  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_numericality_of(:price).is_greater_than(0)}
  it { should belong_to(:category)}

  # it 'validates the presence of title' do
  #   product = Product.new(title:'')
  #   product.validate
  #   expect(product.errors.messages).to include(title: ["can't be blank"])
  # end
end
