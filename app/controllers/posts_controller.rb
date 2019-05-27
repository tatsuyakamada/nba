class PostsController < ApplicationController

  def index
    if logged_in?
      @posts = Post.all.order(created_at: :desc)
    else
      @posts = Post.open_post.order(created_at: :desc)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "ブログを投稿しました！"
      redirect_to :posts
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @member = Member.find_by(id: @post.member_id)
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:notice] = "ブログを更新しました！"
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to :posts
    else
      render "edit"
    end
  end

  private def post_params
    params.require(:post).permit(
      :title,
      :body,
      :image,
      :member_only,
      :member_id
      )
  end

  def search
    @posts = Post.where("member_id = params[:id] ")
  end

end
