class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    get_friend_lists
  end

  def create
    @user = User.find(params[:user_id])
    @relationship  = current_user.sent_requests.build(requested_id: @user.id, accepted: false)
    @relationship.save
    respond_to do |format|
      format.js { render :layout => !request.xhr? }
    end
  end

  def update
    @relationship = Relationship.find(params[:id])
    @relationship.update_attribute(:accepted, true)
    get_friend_lists
    respond_to do |format|
      format.js { render :layout => !request.xhr? }
    end
  end

  def get_friend_lists
    @pending = current_user.friends.pending
    @accepted = current_user.friends.active
  end
  
end
