class UsersController < ApplicationController
  # before_action :authenticate_request, except: [:create]


  def index
    users = User.all
    render json: users, status: 200
  end

  def show
    user = User.find(params[:id])
    render json: UserBlueprint.render(user, view: :default), status: 200
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: user
      # render json: UserBlueprint.render(user, view: :extended), status: 201
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: user, status: 200
    else
      render json: { error: "Account not updated." }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: { message: "Account deleted." }
    else
      render json: { error: "Account not deleted." }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
