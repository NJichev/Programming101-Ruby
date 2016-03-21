class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :destroy, :update, :edit]

  def index
    @products = Product.order("created_at DESC")
    render json: @products
  end

  def show
  end

  def update

  end

  def edit

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render json: @product
    end
  end

  def destroy
    @product.destroy
    redirect_to action: "index" 
  end

  private
    def product_params
      params.require(:product).permit(:name, :password, :email)
    end

    def find_product
      @product = Product.find(params[:id])
    end
end
