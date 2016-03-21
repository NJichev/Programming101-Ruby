# Brands Controller
class BrandsController < ApplicationController
  before_action :find_brand, only: [:show, :destroy, :update, :edit]

  def index
    @brands = Brand.order('created_at DESC')

    render json: @brands
  end

  def count
    @brands = Brand.first(params[:id])

    render json: @brands
  end

  def range
    @brands = Brand.range(params[:id], params[:range])

    p params[:id]
    render json: @brands
  end

  def show
    # render json: @brand
    render :show
  end

  def update
  end

  def edit
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to @brand
    else
      render json: @brand
    end
  end

  def destroy
    @brand.destroy
    redirect_to action: 'index'
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end

  def find_brand
    @brand = Brand.find(params[:id])
  end
end
