class CommentsController < ApplicationController
  before_action :set_commentable
  #before_action :set_comment, only: [:show, :edit, :update, :destroy]
  # GET /comments
  def index
    @comments = @commentable.comments
  end

  # GET /comments/1
  # def show
  # end

  # GET /comments/new
  def new
    @comment = @commentable.comments.build
  end

  # # GET /comments/1/edit
  # def edit
  # end

  # POST /comments
  def create
    @comment = @commentable.comments.create(comment_params)

    if @comment.save
      redirect_to [@commentable, @comment], notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1
  # def update
  #   if @comment.update(comment_params)
  #     redirect_to [@commentable, @comment], notice: 'Comment was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /comments/1
  # def destroy
  #   @comment.destroy
  #   redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  # end

  private
    def set_commentable
      resource, id = request.path.split('/')[1,2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    # def set_comment
    #   @comment = Comment.find(params[:id])
    # end

    def comment_params
      params.require(:comment).permit(:content)
    end
end

