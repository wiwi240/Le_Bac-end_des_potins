class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @like = Like.new(user: current_user, gossip: @gossip)

    if @like.save
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "Impossible d'ajouter un like."
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.user == current_user
      @like.destroy
    end
    redirect_back(fallback_location: root_path)
  end
end