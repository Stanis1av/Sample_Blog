class ArticlesController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :edit, :destroy]

  def is_the_owner
    current_user.id == Article.find(params[:id]).user_id
  end

  def index
    @articles = Article.all

  end

  def show
    @article = Article.find(params[:id])
  end

  def new # Возвращает в браузер форму из new.html.erb
  end

  def create
    @article = Article.new(article_params)

    # current_user.articles << article
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])

    if !is_the_owner
      redirect_to articles_path
      # @error_article = 'You do not have permission to edit this article.'
    end

  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if is_the_owner
      @article.destroy
      redirect_to articles_path
    else
      redirect_to articles_path
      # @error_article = 'You do not have permission to delete this article.'
    end



  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
