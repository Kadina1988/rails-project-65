# frozen_string_literal: true

module Web
  class BulletinsController < ApplicationController
    before_action :find_bulletin, only: %i[show edit update to_moderate archive]
    def index
      @q = Bulletin.where(aasm_state: 'published').ransack(params[:q])
      found_bulletins = @q.result
      bulletins = found_bulletins.limit(25)
      bulletins_pagination(bulletins)
    end

    def new
      @bulletin = Bulletin.new
      authorize @bulletin
    end

    def create
      @bulletin = Bulletin.new(bulletin_params.merge!(user_id: @current_user.id))
      authorize @bulletin
      if @bulletin.save
        redirect_to profile_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show;end

    def edit
      authorize @bulletin
    end

    def update
      authorize @bulletin
      if @bulletin.update(bulletin_params)
        redirect_to profile_path
        flash[:notice] = 'Объявление было обновлено'
      else
        render :edit, status: :unprocessible_entity
      end
    end

    def to_moderate
      @bulletin.to_moderate!
      authorize @bulletin
      redirect_to profile_path
      flash[:notice] = 'Объявление отправлено на модерацию'
    end

    def archive
      @bulletin.archive!
      authorize @bulletin
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
