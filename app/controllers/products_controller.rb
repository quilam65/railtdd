class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :update, :edit]
  before_action :assign_params, only: [:create, :update]
  before_action :authenticate_user!, only: [:edit, :new, :destroy]
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
      # Tat ham gui mail
      # ApplicationMailer.create_product(@product).deliver_now
      redirect_to @product, notice: I18n.t('product.alert.create.success')
    else
      flash[:alert] = I18n.t('product.alert.create.error')
      render :new
    end
  end

  def update
    if @product.update!(@product_params)
      redirect_to @product, notice: I18n.t('product.alert.update.success')
    else
      flash[:alert] = I18n.t('product.alert.update.error')
      render :new
    end
  end

  def edit
  end

  def destroy
    @product.destroy
    redirect_to products_path
    flash[:notice] = I18n.t('product.alert.destroy.success')
  end


  private
    def set_product
      @product = Product.find(params[:id])
    end

    def assign_params
      @product_params = params.require(:product).permit(:title, :description, :price, :category_id, :image)
    end
end
