class ProblemsController < ApplicationController
  before_action :correct_user, {only: [:create, :update, :destroy]}

  def index
    @user = User.new
    @problem = Problem.new
    @problems = Problem.all
  end

  def create
    @problem = current_user.problems.build(problem_params)
    if @problem.save
      flash[:success] = '登録しました。'
      redirect_to root_url
    else
      @problems = Problem.all
      flash[:danger] = '登録できませんでした'
      redirect_to root_url
    end
  end

  def update
    @problem = Problem.find(params[:id])
    @problem.user_id = current_user.id
    if @problem.update(problem_params)
      redirect_to root_url
    else
      @problems = Problem.all
      render :index
    end
  end

  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy
    redirect_to root_url
  end
  private
  def problem_params
    params.require(:problem).permit(:title,:answer)
  end
end
