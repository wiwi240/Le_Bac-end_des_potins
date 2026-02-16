class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      first_name: params[:user][:first_name],
      last_name: params[:user][:last_name],
      email: params[:user][:email],
      age: params[:user][:age],
      city_id: params[:user][:city_id],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
    )

    if @user.save
      log_in(@user)
      flash[:success] = "Compte agent créé avec succès."
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end