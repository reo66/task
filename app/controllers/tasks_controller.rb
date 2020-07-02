class TasksController < ApplicationController
  
  
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end
  
  def new
    @task = Task.new
    @user = User.find(params[:user_id])
  end
  
  def create
     @user = User.find(params[:user_id])
     @task = @user.tasks.new(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url
    else
      render :new
    end
  end
  
  private

    def task_params
      #params.require(:user).permit(:name, :description)
      params.require(:task).permit(:name, :description)
    end
    
end

  

