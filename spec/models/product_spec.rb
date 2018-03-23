require 'rails_helper'

RSpec.describe Product, type: :model do

  let! (:product) { create(:product, description: '<html>a</html>') }
  it 'validates the striphtml of description' do
    expect(product.description).to eq('a')
  end

  let! (:product_title) { create(:product, title: 'TITLE') }
  it 'validates lowercase' do
    expect(product_title.title).to eq('title')
  end

  let! (:product_shorter) { create(:product, title: 'abdaaad', description: 'ab') }
  it 'title is shorter than description' do
    expect(product_shorter.errors.messages).to include(description: ['can\'t be shorter than title'])
    byebug
  end


  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  it { should belong_to(:category) }

  # it 'validates the presence of title' do
  #   product = Product.new(title:'')
  #   product.validate
  #   expect(product.errors.messages).to include(title: ["can't be blank"])
  # end
end
