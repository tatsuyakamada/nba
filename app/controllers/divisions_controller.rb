class DivisionsController < ApplicationController
  before_action :admin_member

  def new
    @conferences = Conference.all
    @division = Division.new
  end

  def create
    @conferences = Conference.all
    @division = Division.new(division_params)
    if @division.save
      redirect_to :conferences
    else
      render "new"
    end
  end

  def edit
    @conferences = Conference.all
    @division = Division.find(params[:id])
  end

  def update
    @division = Division.find(params[:id])
    if @division.update(division_params)
      redirect_to :conferences
    else
      render "edit"
    end
  end

  def destroy
    @division = Division.find(params[:id])
    if @division.destroy
      redirect_to :conferences
    else
      render "edit"
    end
  end

  private def division_params
    params.require(:division).permit(
      :conference_id,
      :division_name
    )
  end

end
