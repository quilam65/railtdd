require 'rails_helper'

RSpec.describe Category, type: :model do
  # it 'validates the presence of title' do
  #   product = Product.new(title:'')
  #   product.validate
  #   expect(product.errors.messages).to include(title: ["can't be blank"])
  # end
  it { should have_many(:products)}
end
