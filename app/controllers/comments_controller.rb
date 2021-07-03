class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_post, only: [:create, :edit, :update]


  before_action :authenticate_user!, :only => [:create]

  def create
    # @post = Post.find(params[:post_id])
    # method 1
    @comment = @post.comments.create(comment_params)
    @comment.author_name = current_user.username

        respond_to do |format|
            if  @comment.save
                format.html { redirect_to @post, notice: 'Comment was successfully created.' }
                # NOTE COMMENT STEP 1: This will run the code in `app/views/comments/create.js.erb`.
                format.js
                # format.json { render json: @post, status: :created, location: @post }
            else
                format.html { render action: "new" }
                # NOTE COMMENT STEP 1: This will run the code in `app/views/comments/create.js.erb`.
                format.js
                # format.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    # method 2
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.new(comment_params)

    # @comment.author_name = current_user.username

    # @comment.save

    # redirect_to article_path(@article)
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
