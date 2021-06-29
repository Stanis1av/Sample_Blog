class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :edit, :destroy]

  def is_the_owner
    current_user.id == Post.find(params[:id]).user_id
  end

  def index
    @posts = Post.all.order(created_at: :desc)

  end

  def show
    @post = Post.find(params[:id])
  end

  def new # Возвращает в браузер форму из new.html.erb
  end

  def create
    @post = Post.new(article_params)

    # current_user.posts << article
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: "Статья успешно создана"
    else
      render action: 'new', alert: "Не удалось создать статью"
    end
  end

  def edit
    @post = Post.find(params[:id])

    if !is_the_owner
      render @post
      # @error_article = 'You do not have permission to edit this Post.'
    end

  end

  def update
    @post = Post.find(params[:id])

    if @post.update(article_params)
      redirect_to @post, notice: "Статья успешно обновлена"
    else
      render action: 'edit', alert: "Не удалось обновить статью"
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if is_the_owner
      @post.destroy
      redirect_to post_path, notice: "Статья успешно удалена"
    else
      render "new", alert: "Не удалось удалить статью"
      # @error_article = 'You do not have permission to delete this Post.'
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :tag_list)
  end
end
