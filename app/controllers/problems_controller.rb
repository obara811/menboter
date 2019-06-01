class ProblemsController < ApplicationController
   def index
    @problem = Problem.new
    @problems = Problem.all
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to root_url
    else
      @problems = Problem.all
      render :index
    end
  end

  def update
    @problem = Problem.find(params[:id])
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
