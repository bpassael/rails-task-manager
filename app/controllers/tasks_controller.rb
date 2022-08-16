class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]


  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new # Needed to instantiate the form_for
  end

  def create
    @task = Task.new(task_params)
    @task.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to root_path
  end

  def edit; end

  def update
    @task.update(task_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to root_path
  end

  def destroy
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to root_path, status: :see_other
  end




  private

  def set_task
    @task = Task.find(params[:id])
  end


  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
