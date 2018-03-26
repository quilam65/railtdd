require 'rails_helper'
RSpec.describe ProductsController, type: :controller do
  # GET #####
  let(:product) { create(:product) }

  describe '#index' do
    let!(:products) { create_list(:product, 5) }
    it 'gets a list of products' do
      get :index
      expect(assigns(:products).size).to eq products.size
    end
  end

  describe '#new' do
    login_admin
    it 'create a product' do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe '#show' do
    it "show product" do
      get :show, params: { id: product.id }
      expect(assigns(:product)).to eq product
    end
  end

  describe '#edit' do
    login_admin
    it "edit product" do
      get :edit, params: { id: product.id }
      expect(assigns(:product).id).to eq product.id
    end
  end

  ###POST###
  describe '#create' do
    context 'success' do
      it "creates a new product" do
        expect{
          post :create, params: { product: FactoryBot.attributes_for(:product) }
        }.to change(Product, :count).by(1)
        expect(response).to redirect_to assigns(:product)
      end
    end

    context 'fail' do
      it "creates a new product" do
        post :create, params: { product: FactoryBot.attributes_for(:product, price: 0) }
        expect(response).to render_template :new
      end
    end
  end

  describe '#delete' do
    login_admin
    let!(:product) { create(:product) }
    it ' delete a product' do
      expect{
        delete :destroy, params: { id: product.id }
      }.to change(Product, :count).by(-1)
      expect(response).to redirect_to products_path
    end
  end

  ### PUT ###
  describe "PUT 'update/:id'" do
    login_admin
    it "product to be updated" do
      product_params = { :title => "new title", :description => "new description" }
      put :update, params: { :id => product.id, :product => product_params }
      expect(assigns(:product).title).to eq('new title')
      response.should redirect_to assigns(:product)
    end
  end

end
