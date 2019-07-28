class PostsController < ApplicationController
  def new
  end

  def create

  end

  def index
    respond_to do |format|
      format.html { @posts = Post.all }
      format.js do
        @post = current_user.posts.build(post_params)
        @post.save
        @posts = Post.all
      end
    end

  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:content)
    end
end
