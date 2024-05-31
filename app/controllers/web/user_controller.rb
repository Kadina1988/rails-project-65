# frozen_string_literal: true

module Web
  class UserController < ApplicationController
    def profile
      @b = Bulletin.ransack(params[:b])
      @bull = @b.result
    end
  end
end
