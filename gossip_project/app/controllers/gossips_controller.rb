class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
    @comment = @gossip.comments
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @g = Gossip.new(user_id: 11, title: params["title"], content: params["content"])
    if @g.save
      flash[:notice] = "Post successfully created"
      redirect_to root_path
    elsif @g.errors.any?
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

end
