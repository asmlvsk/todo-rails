class CategoriesTasksController < ApplicationController
    before_action :set_task!, :set_category!
    
    def index
        c = @task.categories.all
        render json: c
    end

    def update
        if @task.categories << @category
            json_string = TaskSerializer.new(@task).serializable_hash.to_json
            render json: json_string, status: :ok
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @task.categories.delete(@category)
            json_string = TaskSerializer.new(@task).serializable_hash.to_json
            render json: json_string, status: :ok
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    private

    def categories_tasks_params
        params.require(:categories_tasks).permit(:task_id, :id)
    end

    def set_task!
        @task = Task.find_by id: params[:task_id]
    end

    def set_category!
        @category = Category.find_by id: params[:id]
    end
end