class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # otherwise id = params[:id]
    # @task = task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create

    task = Task.new(task_params)
    task.save
    redirect_to task_path(task) #it will automatically retrieve the id
  end

  def edit
    # @task = task.find(params[:id])
  end

  def update
    # @task = task.find(params[:id])
    @task.update(task_params)
    redirect_to "/"
  end

  def destroy
    # @task = task.find(params[:id])
    @task.destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end


  def task_params
    params.require(:task).permit(:name, :details)
  end


end
