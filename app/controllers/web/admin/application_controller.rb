# frozen_string_literal: true

module Web
  module Admin
    class ApplicationController < ApplicationController
      include Pundit
      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      layout 'web/admin/layouts/application'

      def user_not_authorized
        flash[:alert] = 'Доступно только админам'
        redirect_to root_path
      end
    end
  end
end
