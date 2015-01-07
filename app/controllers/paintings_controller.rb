class PaintingsController < ApplicationController
  USER_ID, PASSWORD = "admin", "123456"

  # Require authentication for new, edit and delete operation
  before_filter :authenticate, :only => [ :new, :create, :update, :edit, :destroy ]

  def index
    @paintings = Painting.paginate(:page => params[:page], :per_page => 6)
  end
  def new
    @painting = Painting.new
    @categories = Category.all
  end

  def edit
    @painting = Painting.find(params[:id])
    @categories = Category.all
  end

  def show
    @painting = Painting.find(params[:id])
  end

  def create
    @painting = Painting.new(painting_params)

    if @painting.save
      redirect_to @painting
    else
      @categories = Category.all
      render 'new'
    end
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update(painting_params)
      redirect_to @painting
    else
      @categories = Category.all
      render 'edit'
      end
  end
  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy

    redirect_to paintings_path
  end

  def show_categories
    @category = Category.find(params[:id])
  end

  private
  def painting_params
    params.require(:painting).permit(:title, :artist_id, :body, :year, :material, :location, :image, :category_id)
  end
  private
  def authenticate
    authenticate_or_request_with_http_basic do |id, password|
      id == USER_ID && password == PASSWORD
    end
  end
end