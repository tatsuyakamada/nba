class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all.order(match_day: :desc)
  end

end
