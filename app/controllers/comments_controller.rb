class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    # method 1
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.author_name = current_user.username

    @comment.save

    redirect_to article_path(@comment.article)
    # method 2
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.new(comment_params)

    # @comment.author_name = current_user.username

    # @comment.save

    # redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
