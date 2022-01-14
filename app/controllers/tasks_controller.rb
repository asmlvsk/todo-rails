class TasksController < ApplicationController
    before_action :set_task, only: %i[show update destroy]

    # GET /tasks
    def index
        @task = Task.all
        json_string = TaskSerializer.new(@task).serializable_hash.to_json
        render json: json_string
    end

    # GET /tasks/:id
    def show
        options = {
            include: [:categories]
        }
        json_string = TaskSerializer.new(@task, options).serializable_hash.to_json
        render json: json_string
    end

    # POST /tasks
    def create
        @task = Task.new task_params
        if(@task.save)
            render json: @task, status: :created
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    # PATCH /tasks/:id
    def update
        if @task.update task_params
            render json: @task, status: :ok
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    # DELETE /tasks/:id
    def destroy
        @task.destroy
    end


    private

    def task_params
        params.require(:task).permit(:title, :body)
    end

    def set_task
        @task = Task.find_by id: params[:id]
    end
end
