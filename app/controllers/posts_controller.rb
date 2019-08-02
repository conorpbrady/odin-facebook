class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    respond_to do |format|
      @post = current_user.posts.build(post_params)
      @post.save
      @posts = feed_posts
      format.js { render :layout => !request.xhr? }
    end
  end

  def index
    @posts = feed_posts
  end

  def destroy
    Post.destroy(params[:id])
    @posts = feed_posts
    respond_to do |format|
      format.js { render :layout => !request.xhr? }
    end
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end

    def feed_posts
      Post.where('author_id IN (?)', current_user.friends_users_ids)
    end
end
