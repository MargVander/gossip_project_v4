class CommentsController < ApplicationController
  include SessionsHelper
  before_action :authenticate_user, only: [:new, :edit]
  before_action :user_match, only: [:edit, :destroy]


  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(gossip_id: params["gossip_id"], content: params["content"])
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment successfully created"
      redirect_to gossip_path(params["gossip_id"])
    elsif @comment.errors.any?
      flash[:notice] = "Comment fail"
      redirect_to new_gossip_comment_path(params["gossip_id"])
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = @comment.gossip
  end

  def update
    @comment = Comment.find(params[:id])
    commentparams = params.require(:comment).permit(:content)
    if @comment.update(commentparams)
      flash[:notice] = "Comment successfully edited"
      redirect_to gossip_path(@comment.gossip.id)
    elsif @comment.errors.any?
      flash[:notice] = "Edit fail"
      redirect_to edit_gossip_comment_path(@comment.gossip.id, @comment.id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip.id)
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def user_match
    @comment = Comment.find(params["id"])
    unless current_user.id == @comment.user.id
      flash[:danger] = "You are not allowed."
      redirect_to root_path
    end
  end

end
