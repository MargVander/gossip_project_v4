class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    puts params
    @comment = Comment.new(user_id: 11, gossip_id: params["gossip_id"], content: params["content"])
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

end
