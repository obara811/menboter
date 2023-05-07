class UsersController < ApplicationController
  before_action :correct_user, only: [:index]
  def index
      @users = User.all
  end

  def new
    if logged_in?
      flash[:danger] = "無効な操作です。"
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
