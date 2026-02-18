class UsersController < ApplicationController
  before_action :authenticate_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # Utilisation de params[:user] car le formulaire d'inscription est imbriqué
    u = params[:user]
    @user = User.new(
      first_name: u[:first_name],
      last_name: u[:last_name],
      email: u[:email],
      age: u[:age],
      description: u[:description],
      password: u[:password],
      city: City.all.sample
    )

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Compte créé."
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # Utilisation de params direct car le formulaire d'édition est à plat (flat)
    if @user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      age: params[:age],
      description: params[:description]
    )
      flash[:success] = "Profil mis à jour."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def authenticate_user
    @user = User.find(params[:id])
    unless session[:user_id] == @user.id
      flash[:danger] = "Accès refusé."
      redirect_to root_path
    end
  end
end