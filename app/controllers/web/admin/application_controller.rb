# frozen_string_literal: true

module Web
  module Admin
    class ApplicationController < ApplicationController
      rescue_from Pundit::NotAuthorizedError, with: :admin_not_authorized

      layout 'web/admin/layouts/application'

      def admin_not_authorized
        flash[:alert] = 'Доступно только админам'
        redirect_to root_path
      end
    end
  end
end
