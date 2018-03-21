class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  before_action :assign_params, only: [:create]
  def index
    @products = Product.all
  end

  def show

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(@product_params)
    @product.save
  end


  private
    def set_product
      @product = Product.find(params[:id])
    end

    def assign_params
      @product_params = params.require(:product).permit(:title, :description, :price, :category_id)
    end
end
