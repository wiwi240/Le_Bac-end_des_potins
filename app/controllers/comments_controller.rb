class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]

  def create
    @comment = Comment.new(
      content: params[:content],
      gossip_id: params[:gossip_id],
      user: current_user
    )

    if @comment.save
      flash[:success] = "Commentaire archivé."
      redirect_to gossip_path(params[:gossip_id])
    else
      flash[:danger] = "Le commentaire ne peut pas être vide."
      redirect_to gossip_path(params[:gossip_id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    gossip_id = @comment.gossip_id
    
    if current_user == @comment.user
      @comment.destroy
      flash[:success] = "Commentaire supprimé."
    else
      flash[:danger] = "Accès refusé."
    end
    
    redirect_to gossip_path(gossip_id)
  end
end