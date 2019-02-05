class HomepageController < ApplicationController
  def index
    @gossip = Gossip.all
  end
end
