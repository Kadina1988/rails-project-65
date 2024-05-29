# frozen_string_literal: true

module Web
  module Admin
    class BulletinsController < Admin::ApplicationController
      def index
        @bulletins = Bulletin.first_new
        authorize @bulletins
      end

      def archive
        bulletin = Bulletin.find(params[:id])
        bulletin.archive!
        redirect_to admin_bulletins_path
        flash[:notice] = 'Объявление было успешно заархивировано'
      end
    end
  end
end
