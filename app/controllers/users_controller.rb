class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.where('id != ?', current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.profile_picture.attach(params[:user][:profile_picture])
    respond_to do |format|
      format.js { render :layout => !request.xhr? }
    end
  end

end
