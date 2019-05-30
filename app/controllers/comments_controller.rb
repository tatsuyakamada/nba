class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find_by(id: :post_id)
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      render "/posts/index"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "コメントを削除しました。"
      redirect_to @post
    else
      render "/posts/show"
    end
  end

  private def comment_params
    params.require(:comment).permit(
      :body,
      :post_id,
      :member_id
    )
  end


end
