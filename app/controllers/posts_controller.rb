class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    respond_to do |format|
      @post = current_user.posts.build(post_params)
      @post.save
      @posts = Post.all
      format.js { render :layout => !request.xhr? }
    end
  end

  def index
    @posts = Post.where('author_id IN (?)', current_user.friends_users_ids)
  end

  def destroy
    Post.destroy(params[:id])
    @posts = Post.all
    respond_to do |format|
      format.js { render :layout => !request.xhr? }
    end
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
