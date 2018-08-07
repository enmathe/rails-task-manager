class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new(params[:task])
    @task.save
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    # strong_params: whitelist params coming from potentially malicious user
    params.require(:task).permit(:title, :details)
  end

end
