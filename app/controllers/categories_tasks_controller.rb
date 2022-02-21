class CategoriesTasksController < ApplicationController
    # before_action :set_task!, only: %i[update]

    # include CurrentUserConcern

    # def update 
    #     task_categories = params[:task][:categories].map{|category| category["id"]}
    #     @task.categories.destroy_all
    #     task_categories.each do |a|
    #         CategoriesTasks.create(category_id: a, task_id: @task.id)
    #     end
    #     json_string = TaskSerializer.new(@task).serializable_hash.to_json
    #     render json: json_string, status: :ok
    # end

    # private

    # def set_task!
    #     @task = Task.find_by id: params[:task_id]
    # end
end