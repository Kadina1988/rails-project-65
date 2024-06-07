# frozen_string_literal: true

module Web
  class UserController < ApplicationController
    def profile
      @q = @current_user.bulletins.ransack(params[:q])
      @bull = @q.result.first_new
    end
  end
end
