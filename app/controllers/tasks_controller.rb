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
      flash[:success] = "タスクを新規作成しました"
      redirect_to user_tasks_url
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
  end  
  
  def update
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
    @task.update(task_params)
    if @task.save
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url(@user,@task)
    else  
      render :edit      
    end
  end

def show
   @user = User.find(params[:user_id])
 @task = Task.find(params[:id])
 @user = User.find(params[:user_id])
end


def destroy
  @user = User.find(params[:user_id])
  @task = @user.tasks.find_by(id: params[:id])
  @task.destroy
  flash[:success] = "タスクを消去しました"
  redirect_to user_tasks_url @user
  
end   

  
  
  private

    def task_params
      #params.require(:user).permit(:name, :description)
      params.require(:task).permit(:name, :description)
    end
    
end

  

