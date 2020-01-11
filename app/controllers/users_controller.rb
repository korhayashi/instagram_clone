class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    else
      if @user.save
        redirect_to entries_path
      else
        render 'new'
      end
    end
  end

  def edit

  end

  def update

  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :user_name, :password)
  end
end
