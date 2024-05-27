module Web
  class BulletinsController < ApplicationController
    def index
      @bulletins = Bulletin.first_new
    end

    def new
      @bulletin = Bulletin.new
    end

    def create
      @bulletin = Bulletin.new(bulletin_params)
      @bulletin.user_id = 1
      unless @bulletin.save
        render :new
      end
    end

    private
    def bulletin_params
      params.require(:bulletin).permit(:title, :description, :category_id, :image)
    end
  end
end
