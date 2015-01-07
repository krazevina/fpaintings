class CategoriesController < ApplicationController
  USER_ID, PASSWORD = "admin", "123456"

  # Require authentication for new, edit and delete operation
  before_filter :authenticate, :only => [ :new, :create, :update, :edit, :destroy ]

  def index
    @categories = Category.all
  end
  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:nametype)
  end
  private
  def authenticate
    authenticate_or_request_with_http_basic do |id, password|
      id == USER_ID && password == PASSWORD
    end
  end
end
