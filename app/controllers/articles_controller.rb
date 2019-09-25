class ArticlesController < ApplicationController
  before_action :current_member

  def index
    @articles = if logged_in?
                  Article.member_article.order(released_at: :desc)
                else
                  Article.public_article.order(released_at: :desc)
                end
  end

  def show
    @article = Article.find(params[:id])
    @member = Member.find_by(id: @article.member_id)
  end
end
