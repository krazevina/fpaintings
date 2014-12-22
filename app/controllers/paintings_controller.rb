class PaintingsController < ApplicationController
  def index
    @paintings = Painting.order(:year)
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
end