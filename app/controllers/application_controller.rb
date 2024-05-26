# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    @current_user = User.find(session[:user_id])
  end

  def signed_in?
    @current_user.present?
  end
end
