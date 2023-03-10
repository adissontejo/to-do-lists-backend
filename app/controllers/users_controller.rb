# frozen_string_literal: true

# Users API Controller
class UsersController < ApplicationController
  before_action :ensure_authenticated, only: %i[show update destroy]

  # GET /users/logged
  def show
    render json: @current_user, serializer: UserSerializer::WithLists
  end

  # POST /users
  def create
    @user = User.new user_params

    if @user.save
      render json: @user, serializer: UserSerializer::Default
    else
      render json: @user.errors, status: :bad_request
    end
  end

  # POST /users/login
  def login
    @user = User.find_by(email: user_params[:email])

    if @user&.authenticate user_params[:password]
      token = AuthToken.encode @user.id

      render json: { token: token }
    else
      render json: @user.errors, status: 401
    end
  end

  # PUT /users
  def update
    if @current_user.update user_params
      render json: @current_user, serializer: UserSerializer::Default
    else
      render json: @current_user.errors, status: :bad_request
    end
  end

  # DELETE /users
  def destroy
    @current_user.destroy
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
