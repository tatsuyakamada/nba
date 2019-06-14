class TeamPlayersController < ApplicationController

  def new
    @player = Player.find(params[:player_id])
    @team_player = TeamPlayer.new
    @teams = Team.all
  end

  def create
    @team_player = TeamPlayer.new(team_player_params)
    @player = Player.find(params[:player_id])
    @teams = Team.all
    if @team_player.save
      redirect_to @player
    else
      render "new"
    end
  end

  def edit
    @team_player = TeamPlayer.find(params[:id])
    @player = Player.find(params[:player_id])
    @teams = Team.all
  end

  def update
    @team_player = TeamPlayer.find(params[:id])
    @player = Player.find_by(id: :player_id)
    @teams = Team.all
    @team_player.update(team_player_params)
    if @team_player.save
      redirect_to @player
    else
      render "edit"
    end
  end
  private def team_player_params
    params.require(:team_player).permit(
      :team_id,
      :player_id,
      :contract_start,
      :contract_period,
    )

  end

end
