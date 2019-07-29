class ArticlesController < ApplicationController
  before_action :current_member

  #投稿一覧
  def index
    if logged_in?
      @articles = Article.member_article.order(released_at: :desc)
    else
      @articles = Article.open_article.order(released_at: :desc)
    end
  end

  def show
    @article = Article.find(params[:id])
    @member = Member.find_by(id: @article.member_id)
  end
end
