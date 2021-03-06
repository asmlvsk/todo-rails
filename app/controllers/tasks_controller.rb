class TasksController < ApplicationController
    before_action :set_task!, only: %i[show update destroy]

    include CurrentUserConcern

    # GET /tasks
    def index
        @task = @current_user.tasks.all
        options = {
            include: [:categories]
        }
        json_string = TaskSerializer.new(@task, options).serializable_hash.to_json
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
        task = @current_user.tasks.new task_params
        if(task.save)
            json_string = TaskSerializer.new(task).serializable_hash.to_json
            render json: json_string, status: :created
        else
            render json: task.errors, status: :unprocessable_entity
        end
    end

    # PATCH /tasks/:id
    def update 
        task_categories = params[:task][:categories].map{|category| category["id"]}
        @task.categories.destroy_all
        task_categories.each do |a|
            CategoriesTasks.create(category_id: a, task_id: @task.id)
        end
        json_string = TaskSerializer.new(@task).serializable_hash.to_json
        render json: json_string, status: :ok
    end

    def update
        if @task.update task_params
            json_string = TaskSerializer.new(@task).serializable_hash.to_json
            render json: json_string, status: :ok
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
        params.require(:task).permit(:title, :body, :is_done)
    end
    

    def set_task!
        @task = Task.find_by id: params[:id]
    end
end
