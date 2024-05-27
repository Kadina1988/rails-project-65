# frozen_string_literal: true

module Web
  module Admin
    class CategoriesController < ApplicationController
      before_action :find_category, only: %i[edit update destroy]

      def index
        @categories = Category.all
      end

      def new
        @category = Category.new
      end

      def create
        @category = Category.new(category_params)

        if @category.save
          redirect_to admin_categories_path
          flash[:notice] = 'Категория было успшно создана'
        else
          render :new, status: :unprocessable_entity
        end
      end

      def edit; end

      def update
        if @category.update(category_params)
          redirect_to admin_categories_path
          flash[:notice] = 'Категория было успешно изменена'
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        if @category.bulletins.empty?
          @category.destroy
          flash[:notice] = 'Категория было удалена'
          redirect_to admin_categories_path
        else
          redirect_to admin_categories_path
          flash[:alert] = 'Категория имеет обьявления'
        end
      end

      private

      def find_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name)
      end
    end
  end
end
