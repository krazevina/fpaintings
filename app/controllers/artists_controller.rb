class ArtistsController < ApplicationController
  USER_ID, PASSWORD = "admin", "123456"

  # Require authentication for new, edit and delete operation
  before_filter :authenticate, :only => [ :new, :create, :update, :edit, :destroy ]

  def index
    @artists = Artist.order(:born)
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
    redirect_to @artist
    else
      render 'new'
    end
  end

  def update
    @artist = Artist.find(params[:id])

    if @artist.update(artist_params)
      redirect_to @artist
    else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :born, :died, :nationality, :field, :intro, :img)
  end
  private
  def authenticate
    authenticate_or_request_with_http_basic do |id, password|
      id == USER_ID && password == PASSWORD
    end
  end
end