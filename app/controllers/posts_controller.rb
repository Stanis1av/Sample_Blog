class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new(post: @post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)

    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: "Post was successfully saved."
    else
      render action: "new"
    end
  end

  def edit
    if !is_the_owner
      render @post
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    if is_the_owner
      @post.destroy
      redirect_to posts_path, notice: "Post was successfully deleted."
    else
      render actiom: "new"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def is_the_owner
    current_user.id == Post.find(params[:id]).user_id
  end

  def post_params
    params.require(:post).permit(:title, :body, :tag_list)
  end
end
