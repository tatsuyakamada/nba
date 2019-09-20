class ConferencesController < ApplicationController
  before_action :admin_member

  def index
    @conferences = Conference.all
  end

  def new
    @conference = Conference.new
  end

  def create
    @conference = Conference.new(conference_params)
    if @conference.save
      redirect_to :conferences
    else
      render 'new'
    end
  end

  def show
    @conference = Conference.find(params[:id])
    @divisions = Division.where(conference_id: params[:id])
  end

  def edit
    @conference = Conference.find(params[:id])
  end

  def update
    @conference = Conference.find(params[:id])
    @conference.update(conference_params)
    if @conference.save
      redirect_to @conference
    else
      render 'edit'
    end
  end

  def destroy
    @conference = Conference.find(params[:id])
    if @conference.destroy
      redirect_to :conferences
    else
      render 'edit'
    end
  end

  private

  def conference_params
    params.require(:conference).permit(
      :conference_name
    )
  end
end
