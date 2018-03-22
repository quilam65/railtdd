class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :update, :edit]
  before_action :assign_params, only: [:create, :update]
  def index
    @products = Product.order('id desc').all
  end

  def show

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(@product_params)
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def update
    @product.update!(@product_params)
    redirect_to @product
  end

  def edit
  end

  def destroy
    @product.destroy
    redirect_to products_path
    flash[:notice] = "Delete success!"
  end


  private
    def set_product
      @product = Product.find(params[:id])
    end

    def assign_params
      @product_params = params.require(:product).permit(:title, :description, :price, :category_id)
    end
end
