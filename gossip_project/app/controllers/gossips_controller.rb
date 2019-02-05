class GossipsController < ApplicationController
  def show
    @gossip = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
  @g = Gossip.new(title: params["title"], content: params["content"])
    c = City.create(name: "Unknow", zip_code: "00000")
    @g.user = User.create(city: c, first_name: "Anonymous", last_name: "Unknow", description: "Not specified", email: "anonymous@anon.com", age: 0)
    if @g.save
      redirect_to root_path, alert: "Thank you, snake !"
    elsif @g.errors.any?
      redirect_to new_gossip_path
    end


  end
end
