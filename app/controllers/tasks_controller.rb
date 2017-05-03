class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks= Task.all
  end

  def show
     @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "タスクが登録されました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの登録に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = "タスクが編集されました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの編集に失敗しました"
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end
end