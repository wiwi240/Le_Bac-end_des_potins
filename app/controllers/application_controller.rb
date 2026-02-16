class ApplicationController < ActionController::Base
  # Inclusion du module SessionsHelper pour utiliser ses méthodes partout
  include SessionsHelper

  # Rend ces méthodes accessibles directement dans les vues (HTML)
  helper_method :current_user, :logged_in?

  private

  # Méthode pour empêcher l'accès aux pages si l'utilisateur n'est pas connecté
  def authenticate_user
    unless logged_in?
      flash[:danger] = "Accès restreint. Veuillez vous connecter."
      redirect_to new_session_path
    end
  end
end