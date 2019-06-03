class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
    @teams = Team.all
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to @player
    else
      render "new"
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def show
    @player = Player.find(params[:id])
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
      redirect_to @players
    else
      render "edit"
    end
  end

  private def player_params
    params.require(:player).permit(
      :first_name,
      :last_name,
      :number,
      :position,
      :birthday,
      :height,
      :weight,
      :college
    )
  end

end
