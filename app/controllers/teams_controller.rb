class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @divisions = Division.all
    @team = Team.new
  end

  def create
    @divisions = Division.all
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team
    else
      render "new"
    end
  end

  def edit
    @team = Team.find(params[:id])
    @divisions = Division.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    if @team.save
      redirect_to @team
    else
      render "edit"
    end
  end

  def destroy
    @team = Team.find(params[:id])
    if @team.destroy
      redirect_to :teams
    else
      render "edit"
    end
  end


  private def team_params
    params.require(:team).permit(
      :team_image,
      :division_id,
      :team_name,
      :establishment,
      :home_court,
      :owner
    )
  end
end
