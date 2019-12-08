class ProblemsController < ApplicationController
  #before_action :correct_user, {only: [:create, :update, :destroy]}

  def index
    @problem = Problem.new
    @problems = Problem.all.order(created_at: :desc)
  end

  def create
    @problem = current_user.problems.build(problem_params)
    if @problem.save
      redirect_to root_url
    else
      @problems = Problem.all
      render :index
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

  def correct_user
    redirect_to root_url unless current_user.admin?
  end
end
