class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user_id: current_user.id)
    @like.save
    respond_to do |format|
      format.js { render :layout => !request.xhr? }
    end
  end

  def destroy
    @like = Like.destroy(params[:id])
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.js { render :layout => !request.xhr? }
    end
  end
end
