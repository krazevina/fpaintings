class SubpagesController < ApplicationController
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
end
