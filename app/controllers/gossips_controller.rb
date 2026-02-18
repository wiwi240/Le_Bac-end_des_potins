class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(
      title: params[:title],
      content: params[:content],
      user: current_user || User.find_by(first_name: "Anonymous")
    )
    if @gossip.save
      flash[:success] = "Potin créé"
      redirect_to root_path
    else
      render :new
    end
  end
end