class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy, :complete, :mark_complete]

  def index
    @tasks = Task.all
  end

  def show; end

  def edit; end

  def update
    if @task.update!(task_params)
      flash[:success] = "task updated!"
      redirect_to tasks_path
    else
      flash[:alert] = "edit not successful!"
      redirect_to edit_task_path(@task.id)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "task created!"
      redirect_to tasks_path
    else
      flash[:alert] = "creation not successful!"
      redirect_to new_task_path
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = "task destroyed!"
      redirect_to tasks_path
    else
      flash[:alrert] = "destruction not successful!"
      redirect_to task_path(@task.id)
    end
  end

  def complete; end

  def mark_complete
    if @task.update!(completed_at: params[:task][:completed_at])
      @task.save!
      binding.pry
      flash[:success] = "task completed!"
      redirect_to tasks_path
    else
      flash[:alert] = "completion not successful!"
      redirect_to task_complete_path(@task.id)
    end
  end

  private
  def task_params
    params.require(:task).permit(:note, :due_date, :completed_at)
  end


  def find_task
    if params[:id]
      @task = Task.find(params[:id])
    elsif params[:task_id]
      @task = Task.find(params[:task_id])
    end
  end
end