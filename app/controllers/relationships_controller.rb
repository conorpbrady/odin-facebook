class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    get_friend_lists
  end

  def create
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
    @pending = current_user.pending_requests.pending
    @accepted = current_user.friends.active
  end


end
