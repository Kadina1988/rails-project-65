# frozen_string_literal: true

module Web
  module Admin
    class BulletinsController < Admin::ApplicationController
      before_action :find_bulletin, only: %i[archive publish reject]

      def index
        @q = Bulletin.first_new.ransack(params[:q])
        found_bulletins = @q.result
        bulletins = found_bulletins.limit(25)
        bulletins_pagination(bulletins)
        authorize @bulletins
      end

      def on_moderation
        bulletins = Bulletin.where(aasm_state: 'under_moderation').limit(25)
        authorize bulletins
        bulletins_pagination(bulletins)
      end

      def archive
        @bulletin.archive!
        authorize @bulletin
        redirect_back(fallback_location: admin_root_path)
        flash[:notice] = 'Объявление было успешно заархивировано'
      end

      def publish
        @bulletin.publish!
        authorize @bulletin
        redirect_to admin_root_path
        flash[:notice] = 'Объявление было успешно опубликовано'
      end

      def reject
        @bulletin.reject!
        authorize @bulletin
        redirect_to admin_root_path
        flash[:notice] = 'Объявление было успешно возвращено'
      end

      private

      def find_bulletin
        @bulletin = Bulletin.find(params[:id])
      end
    end
  end
end
