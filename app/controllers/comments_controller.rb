class CommentsController < ApplicationController
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(
      content: params[:content],
      user: current_user,
      gossip: @gossip
    )
    if @comment.save
      flash[:success] = "Commentaire publié"
      redirect_to gossip_path(@gossip)
    else
      flash[:danger] = "Erreur lors de la publication"
      redirect_to gossip_path(@gossip)
    end
  end
end