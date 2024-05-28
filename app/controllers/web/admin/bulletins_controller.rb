# frozen_string_literal: true

module Web
  module Admin
    class BulletinsController < Admin::ApplicationController
      def index
        @bulletins = Bulletin.first_new
        authorize @bulletins
      end
    end
  end
end
