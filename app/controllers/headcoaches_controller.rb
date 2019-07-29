class HeadcoachesController < ApplicationController

  def index
    @headcoaches = Headcoach.all
  end

  def new
    @headcoach = Headcoach.new
  end

  def create
    @headcoach = Headcoach.new(headcoach_params)
    if @headcoach.save
      redirect_to @headcoach
    else
      render "new"
    end
  end

  def show
    @headcoach = Headcoach.find(params[:id])
  end

  def edit
    @headcoach = Headcoach.find(params[:id])
  end

  def update
    @headcoach = Headcoach.find(params[:id])
    @headcoach.update(headcoach_params)
    if @headcoach.save
      redirect_to @headcoach
    else
      render "edit"
    end
  end

  def destroy
    @headcoach = Headcoach.find(params[:id])
    if @headcoach.destroy
      redirect_to :headcoaches
    else
      render "edit"
    end
  end

  private def headcoach_params
    params.require(:headcoach).permit(
      :headcoach_image,
      :first_name,
      :last_name,
      :birthday,
      :college
    )

  end

end
