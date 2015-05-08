class UsersController < ApplicationController

  before_action :authenticate
  skip_before_action :authenticate, only: [:new, :create]

  # def index
  #   render json: User.all      
  # end

  def show
    if User.find(params[:id]) == current_user
      @user = User.find(params[:id])
  
      respond_to do |format|
        format.html {}
        format.json { render json: @user }
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user] = @user.id
      redirect_to user_path(@user.id)  
    else
      render :new
    end
  end

  def edit
    if User.find(params[:id]) == current_user
      @user = User.find(params[:id])
    end
  end

  def update
    if User.find(params[:id]) == current_user

      @user = User.find(params[:id])
      @user.update(user_params)
  
      respond_to do |format|
        format.html { redirect_to user_path(@user.id) }
        format.json { render json: @user }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :password_digest, :phone_num)
  end

end