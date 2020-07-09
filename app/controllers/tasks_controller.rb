class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: %i(show edit update destroy)
  before_action :logged_in_user
  before_action :correct_user
  
  def index
    
    @tasks = @user.tasks
  end
  
  def new
    @task = Task.new
   
  end
  
  def create
     @user = User.find(params[:user_id])
     @task = @user.tasks.new(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  
  def edit
    
  end  
  
  def update
    @task.update(task_params)
    if @task.save
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url(@user,@task)
    else  
      render :edit      
    end
  end

def show
end


def destroy
  @task.destroy
  flash[:success] = "タスクを消去しました"
  redirect_to user_tasks_url @user
  
end   

  
  
  private
  
  def set_user
      @user = User.find(params[:user_id])
  end

def set_task
  
      unless @task = current_user.tasks.find_by(id: params[:id])
        flash[:danger] = "権限がありません。"
        redirect_to user_tasks_url current_user
      end   
end        


    
    def task_params
      params.require(:task).permit(:name, :description)
    end
    
end

  

