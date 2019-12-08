class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:index]
  has_many :broblems

  def index
    @users = User.all
  end
end
