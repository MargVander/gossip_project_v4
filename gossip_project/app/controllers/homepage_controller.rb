class HomepageController < ApplicationController
  def home
    @gossip = Gossip.all
  end
end
