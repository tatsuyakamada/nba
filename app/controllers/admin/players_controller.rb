class Admin::PlayersController < ApplicationController
    before_action :admin_member

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
    @teams = Team.all
  end

  def create
    @player = Player.new(player_params)
    @teams = Team.all
    if @player.save
      redirect_to @player
    else
      render "new"
    end
  end

  def player_import

  end

  def edit
    @player = Player.find(params[:id])
    @teams = Team.all
  end

  def show
    @player = Player.find(params[:id])
    @team_player = TeamPlayer.where(player_id: params[:id])
    @team = Team.find_by(id: :team_id)
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)
    if @player.save
      redirect_to @player
    else
      redirect_to "edit"
    end
  end

  def destroy
    @player = Player.find(params[:id])
    if @player.destroy
      redirect_to :players
    else
      render "edit"
    end
  end

  private def player_params
    params.require(:player).permit(
      :player_image,
      :first_name,
      :last_name,
      :number,
      :birthday,
      :height,
      :weight,
      :college,
      position_ids: []
    )
  end

end
