class SessionsController < ApplicationController
  def new
  end

  def create
    @member = Member.find_by(email: params[:session][:email])
    if @member && @member.authenticate(params[:session][:password])
      redirect_to "/"
    else
      flash[:notice] = "ログインできません。"
      render "new"
    end
  end

  def logout

  end
end
