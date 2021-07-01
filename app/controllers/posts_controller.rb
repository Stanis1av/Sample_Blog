class PostsController < ApplicationController
  # NOTE AUTHOR STEP 2: This is needed for the new author form to work in `app/views/posts/new.html.erb` and `app/views/posts/edit.html.erb`.
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :create, :edit, :destroy]

  def is_the_owner
    current_user.id == Post.find(params[:id]).user_id
  end

  def index
    @posts = Post.all.order(created_at: :desc)

  end

  def show
    # NOTE COMMENT STEP 2: This is needed in order for `app/views/comments/_form.html.erb` to use `@comment`.
    # NOTE COMMENT STEP 2: Using `@comment = @post.comments.build` did not work. This was becuase `<%= render "comments/form" %>` was being rendered before `<%= render @post.comments %>` in `app/views/posts/show.html.erb`.
    @comment = Comment.new(post: @post)
  end

  def new # Возвращает в браузер форму из new.html.erb
    @post = Post.new
  end

  def create
    @post = Post.create(article_params)

    # current_user.posts << article
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: "Статья успешно создана"
    else
      render action: 'new', alert: "Не удалось создать статью"
    end
  end

  def edit
    if !is_the_owner
      render @post
      # @error_article = 'You do not have permission to edit this Post.'
    end

  end

  def update
    if @post.update(article_params)
      redirect_to @post, notice: "Статья успешно обновлена"
    else
      render action: 'edit', alert: "Не удалось обновить статью"
    end
  end

  def destroy
    if is_the_owner
      @post.destroy
      redirect_to post_path, notice: "Статья успешно удалена"
    else
      render "new", alert: "Не удалось удалить статью"
      # @error_article = 'You do not have permission to delete this Post.'
    end

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :tag_list)
  end
end
