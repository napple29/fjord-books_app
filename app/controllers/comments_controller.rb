class CommentsController < ApplicationController
  before_action :set_commentable
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]
  # GET /comments
  # def index
  #   @comments = @commentable.comments
  # end

  # POST /comments
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @commentable
  end

  private
  def set_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
