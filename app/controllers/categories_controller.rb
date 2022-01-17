class CategoriesController < ApplicationController
    def show
        @category = Category.includes(:task).order(created_at: :desc)
    end
end
