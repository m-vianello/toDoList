class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy, :complete, :mark_complete, :in_progress, :mark_in_progress]

  def index
    @tasks = Task.in_progress.order(:due_date)
    @completed_tasks = Task.completed.order(:completed_at)
  end

  def show; end

  def edit; end

  def update
    if @task.update!(task_params)
      flash[:success] = "Task updated!"
      redirect_to tasks_path
    else
      flash[:alert] = "Update not successful!"
      redirect_to edit_task_path(@task.id)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = "Task created!"
      redirect_to tasks_path
    else
      flash[:alert] = "Creation not successful!"
      redirect_to new_task_path
    end
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task destroyed!"
      redirect_to tasks_path
    else
      flash[:alrert] = "Destruction not successful!"
      redirect_to task_path(@task.id)
    end
  end

  def mark_complete
    if @task.update!(completed_at: Time.zone.now)
      @task.save!
      flash[:success] = "Task completed!"
      redirect_to tasks_path
    else
      flash[:alert] = "Completion not successful!"
      redirect_to task_complete_path(@task.id)
    end
  end

  def mark_in_progress
    if @task.update!(completed_at: nil)
      @task.save!
      flash[:success] = "Task returned to in-progress!"
      redirect_to tasks_path
    else
      flash[:alert] = "Updating not successful!"
      redirect_to task_complete_path(@task.id)
    end
  end

  private
  def task_params
    params.require(:task).permit(:note, :due_date, :completed_at, :effort_level)
  end


  def find_task
    if params[:id]
      @task = Task.find(params[:id])
    elsif params[:task_id]
      @task = Task.find(params[:task_id])
    end
  end
end