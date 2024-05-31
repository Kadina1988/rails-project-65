# frozen_string_literal: true

module Web
  class BulletinsController < ApplicationController
    before_action :find_bulletin, only: %i[show edit update to_moderate archive]
    def index
      @q = Bulletin.ransack(params[:q])
      @bulletins = @q.result
    end

    def new
      @bulletin = Bulletin.new
    end

    def create
      @bulletin = Bulletin.new(bulletin_params.merge!(user_id: @current_user.id))
      @bulletin.save
    end

    def show; end

    def edit; end

    def update
      if @bulletin.update(bulletin_params)
        redirect_to profile_path
        flash[:notice] = 'Объявление было обновлено'
      else
        render :edit, status: :unprocessible_entity
      end
    end

    def to_moderate
      @bulletin.to_moderate!
      redirect_to profile_path
      flash[:notice] = 'Объявление отправлено на модерацию'
    end

    def archive
      @bulletin.archive!
      redirect_to profile_path
      flash[:notice] = 'Объявление отправилось в архив'
    end

    private

    def bulletin_params
      params.require(:bulletin).permit(:title, :description, :category_id, :image)
    end

    def find_bulletin
      @bulletin = Bulletin.find(params[:id])
    end
  end
end
