class Admin::MembersController < ApplicationController
  before_action :admin_member

  def index
    @members = Member.all.order(created_at: :desc)
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to :members
    else
      render 'new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def show
    @member = Member.find(params[:id])
    id = @member.id
    @posts = Post.where('member_id == ?', id).order(created_at: :desc)
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    if @member.save
      redirect_to @member
    else
      render 'edit'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    if @member.destroy
      flash[:notice] = '削除しました。'
      redirect_to :members
    else
      render 'edit'
    end
  end

  private

  def member_params
    params.require(:member).permit(
      :profile_image,
      :last_name,
      :first_name,
      :last_name_call,
      :first_name_call,
      :email,
      :birthday,
      :sex,
      :administrator,
      :password,
      :password_confirmation
    )
  end
end
