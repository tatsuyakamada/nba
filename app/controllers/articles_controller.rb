class ArticlesController < ApplicationController

  #投稿一覧
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  #新規登録
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to :articles
    else
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.save
      redirect_to @article
    else
      redirect_to "edit"
    end
  end

  def destroy

  end

  private def article_params
    params.require(:article).permit(
      :title,
      :body,
      :released_at,
      :expired_at,
      :member_only
      )
  end


end
