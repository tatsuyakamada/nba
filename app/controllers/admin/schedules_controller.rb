class Admin::SchedulesController < ApplicationController
  before_action :admin_member

  def index
    @schedules = Schedule.all.order(match_day: :desc)
  end

  def new
    @teams = Team.all.order(team_name: :asc)
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to :admin_schedules
    else
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    if @schedule.save
      redirect_to :admin_schedules
    else
      render "edit"
    end
  end

  def destroy

  end

  private def schedule_params
    params.require(:schedule).permit(
      :match_day,
      :venue,
      :home_score,
      :away_score,
      :home_team_id,
      :away_team_id
    )
  end


end
