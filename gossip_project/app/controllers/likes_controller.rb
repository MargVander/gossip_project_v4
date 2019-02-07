class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]



  def create
    if already_liked?
      flash[:danger] = "You can't like more than once"
    else
      @gossip.likes.create(user_id: current_user.id)
    end
    redirect_to request.referrer
  end

  def destroy
  if !(already_liked?)
    flash[:danger] = "Cannot unlike"
  else
    @like.destroy
  end
  redirect_to request.referrer
end

  private
  def find_like
   @like = @gossip.likes.find(params[:id])
end

  def already_liked?
    Like.where(user_id: current_user.id, gossip_id:
      params[:gossip_id]).exists?
    end

    def find_post
      @gossip = Gossip.find(params[:gossip_id])
    end
  end
