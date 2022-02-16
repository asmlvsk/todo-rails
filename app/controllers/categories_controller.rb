class CategoriesController < ApplicationController
    def index
        category = Category.all
        json_string = CategorySerializer.new(category).serializable_hash.to_json
        render json: json_string
    end
end
