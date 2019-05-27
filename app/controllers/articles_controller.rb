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

  #新規登録
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "記事を投稿しました！"
      redirect_to @article
    else
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
    @member = Member.find_by(id: @article.member_id)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    if @article.save
      flash[:notice] = "更新しました。"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to :articles
    else
      render "edit"
    end
  end

  private def article_params
    params.require(:article).permit(
      :title,
      :body,
      :released_at,
      :expired_at,
      :member_only,
      :member_id
      )
  end

  private def administrator
    @member.administrator == true
  end

end
