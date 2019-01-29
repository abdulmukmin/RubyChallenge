class TasksController < ApplicationController
  before_action :authorize_task, only: [:show, :update, :destroy]
  before_action :set_task, only: [:show, :update, :destroy]


  # GET /tasks
  def index
    @tasks = Task.where("user_id = ?", current_user.id) 
    render json: @tasks
  end

  # GET /tasks/duedates/asc
  def index_duedates_asc
    @tasks = Task.where("user_id = ?", current_user.id).order(due_date: :asc)
    render json: @tasks
  end

  # GET /tasks/duedates/desc
  def index_duedates_desc
    @tasks = Task.where("user_id = ?", current_user.id).order(due_date: :desc)
    render json: @tasks
  end

  # GET /tasks/description/asc
  def index_description_asc
    @tasks = Task.where("user_id = ?", current_user.id).order(description: :asc)
    render json: @tasks
  end

  # GET /tasks/description/desc
  def index_description_desc
    @tasks = Task.where("user_id = ?", current_user.id).order(description: :desc)
    render json: @tasks
  end

      # GET /tasks/priority/asc
  def index_priority_asc
    @tasks = Task.where("user_id = ?", current_user.id).order(priority: :asc)
    render json: @tasks
  end

  # GET /tasks/priority/desc
  def index_priority_desc
    @tasks = Task.where("user_id = ?", current_user.id).order(priority: :desc)
    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    if validate_date
      render json: {status: 400, message: "The minimum date that can be inputted is today"}, status: 400
    else
      @task = Task.new(task_params)
      @task.user_id = current_user.id
  
      if @task.save
        render json: @task, status: :created, location: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if validate_date
      render json: {status: 400, message: "The minimum date that can be inputted is today"}, status: 400
    else
      if @task.update(task_params)
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:description, :due_date, :priority, :user_id)
    end

    def validate_date
      dateNow = DateTime.now.to_date
      dateInput = params["due_date"].to_date
      dateInput < dateNow
    end

    def authorize_task
      task = Task.find(params[:id])
      if task.user_id != current_user.id
        render json: {status: 400, message: "Unauthorize access!"}, status: 400
      end
    end
end
