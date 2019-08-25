class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:index]

  def index
    @users = User.all
  end
end
