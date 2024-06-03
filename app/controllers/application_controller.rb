# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :signed_in?
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.present?
  end

  def bulletins_pagination(list)
    if params[:page].nil? || params[:page] == 1
      @bulletins = list.page(1)
    else
      @bulletins = list.page(params[:page])
    end
  end
end
