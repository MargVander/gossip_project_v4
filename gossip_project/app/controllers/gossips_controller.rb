class GossipsController < ApplicationController
  include SessionsHelper
  before_action :authenticate_user, only: [:new, :edit]
  before_action :user_match, only: [:edit, :destroy]



  def show
    @gossip = Gossip.find(params[:id])
    @comment = @gossip.comments
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params["title"], content: params["content"])
    @gossip.user = current_user
    if @gossip.save
      flash[:notice] = "Post successfully created"
      redirect_to root_path
    elsif @gossip.errors.any?
      flash[:notice] = "Post fail"
      redirect_to new_gossip_path
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossipparams = params.require(:gossip).permit(:title, :content)
    if @gossip.update(gossipparams)
      flash[:notice] = "Post successfully edited"
      redirect_to root_path
    elsif @gossip.errors.any?
      flash[:notice] = "Edit fail"
      redirect_to edit_gossip_path(params[:id])
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def user_match
    @gossip = Gossip.find(params[:id])
    unless current_user.id == @gossip.user.id
      flash[:danger] = "You are not allowed."
      redirect_to root_path
    end
  end
end
