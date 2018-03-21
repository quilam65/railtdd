require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe '#index' do
    let!(:products) { create_list(:product, 5) }
    it 'gets a list of products' do
      get :index
      expect(assigns(:products)).to eq products
    end
  end

  describe '#new' do
    let! (:product) { create(:product) }
    it 'create a product' do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end


  describe '#show' do
    let! (:product) { create(:product) }
    it "show product" do
      get :show, params: { id: product.id }
      # byebug
      expect(assigns(:product)).to eq product
    end
  end

  # describe '#edit' do
  #   let! (:product) { create(:product) }
  #   it "edit product" do
  #     get :edit, params: { id: product.id }
  #     # byebug
  #     expect(assigns(:product)).to eq product
  #   end
  # end

  describe '#create' do
    it "creates a new product" do
      expect{
        post :create, params: { product: FactoryBot.attributes_for(:product) }
      }.to change(Product,:count).by(1)
    end
  end



end
