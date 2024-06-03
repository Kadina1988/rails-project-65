# frozen_string_literal: true

module Web
  class AuthController < ApplicationController
    def callback
      user = User.find_by(email: user_info['email']) || User.create(email: user_info['email'],
                                                                    name: user_info['name'])

      session[:user_id] = user.id
      redirect_to root_path
    end

    def sign_out
      session[:user_id] = nil
      redirect_to root_path
    end

    private

    def user_info
      @user_info = request.env['omniauth.auth']['info']
    end
  end
end
