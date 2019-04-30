class ArticlesController < ApplicationController

  #投稿一覧
  def index
    @articles = Article.all
  end

  #新規登録
  def new
    @article = Article.new
  end

  def create

  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end

end
