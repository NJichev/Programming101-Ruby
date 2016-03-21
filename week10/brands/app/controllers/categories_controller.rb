class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :destroy, :update, :edit]

  def index
    @categories = Category.order("created_at DESC")
    render json: @categories
  end

  def show
  end

  def update

  end

  def edit

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render json: @category
    end
  end

  def destroy
    @category.destroy
    redirect_to action: "index" 
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def find_category 
      @category = Category.find(params[:id])
    end
end

