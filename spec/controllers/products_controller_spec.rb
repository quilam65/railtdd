require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it 'gets a list of products' do
      cate = Category.create(title: 'abcd')
      products = []
      products << Product.create(title: '123', description: '1234', price: 1, category_id: cate.id)
      products << Product.create(title: '123', description: '1234', price: 1, category_id: cate.id)
      # products << Product.create(title: '123', description: '1234')
      get :index
      expect(assigns(:products)).to eq products
    end
  end
end
