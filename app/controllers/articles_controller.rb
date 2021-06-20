class ArticlesController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :edit, :destroy]

  def is_the_owner
    current_user.id == Article.find(params[:id]).user_id
  end

  def index
    @articles = Article.all.order(created_at: :desc)

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
      redirect_to @article, notice: "Статья успешно создана"
    else
      render action: 'new', alert: "Не удалось создать статью"
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
      redirect_to @article, notice: "Статья успешно обновлена"
    else
      render action: 'edit', alert: "Не удалось обновить статью"
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if is_the_owner
      @article.destroy
      redirect_to articles_path, notice: "Статья успешно удалена"
    else
      redirect_to articles_path, alert: "Не удалось удалить статью"
      # @error_article = 'You do not have permission to delete this article.'
    end

  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :tag_list)
  end
end
