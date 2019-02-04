class GossipsController < ApplicationController
  def show
    @gossip = Gossip.all
  end
end
