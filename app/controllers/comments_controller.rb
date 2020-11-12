class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

    @comment.author = current_user.username
    @comment.save

    # current_user.username

    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body) # :author, :body
  end

end
