class ArticlesController < ApplicationController
  def new # Возвращает в браузер форму из new.html.erb
  end

  def create
    @article = Article.new(article_params)

    if @article.valid?
      @article.save
    else
      render action: 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
