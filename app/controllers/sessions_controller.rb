class SessionsController < ApplicationController
  def new; end

  def create
    @member = Member.find_by(email: params[:session][:email])
    if @member &.authenticate(params[:session][:password])
      log_in(@member)
      redirect_to '/'
    else
      flash[:notice] = 'ログインできません'
      render 'new'
    end
  end

  def logout
    log_out
    redirect_to login_path
  end
end
