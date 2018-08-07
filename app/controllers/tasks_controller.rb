class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path(task)
  end

  def update
    task = Task.new(task_params)
    task.save
  end


  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    # strong_params: whitelist params coming from potentially malicious user
    params.require(:task).permit(:title, :details, :completed)
  end

end
