class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author_id = current_user.id
    @comment.save


    @comments = @post.comments
    respond_to do |format|
      format.js { render :layout => !request.xhr? }
    end
  end

  def destroy
    @comment = Comment.destroy(params[:id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    respond_to do |format|
      format.js { render :layout => !request.xhr? }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
