class SubpagesController < ApplicationController
  USER_ID, PASSWORD = "admin", "123456"

  # Require authentication for new, edit and delete operation
  before_filter :authenticate, :only => [ :new, :create, :update, :edit, :destroy ]

  def index
    @subpages = Subpage.all
  end
  def show
    @subpage = Subpage.find(params[:id])
  end
  def new
    @subpage = Subpage.new
  end
  def edit
    @subpage = Subpage.find(params[:id])
  end
  def create
    @subpage = Subpage.new(subpage_params)

    if @subpage.save
    redirect_to @subpage
    else
      render 'new'
      end
  end
  def update
    @subpage = Subpage.find(params[:id])

    if @subpage.update(subpage_params)
      redirect_to @subpage
    else
      render 'edit'
    end
  end

  def destroy
    @subpage = Subpage.find(params[:id])
    @subpage.destroy

    redirect_to subpages_path
  end

  private
  def subpage_params
    params.require(:subpage).permit(:pagename, :text)
  end
  private
  def authenticate
    authenticate_or_request_with_http_basic do |id, password|
      id == USER_ID && password == PASSWORD
    end
  end
end
