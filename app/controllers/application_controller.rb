# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  helper_method :signed_in?
  before_action :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.present?
  end

  def bulletins_pagination(list)
    @bulletins = if params[:page].nil? || params[:page] == 1
                   list.page(1)
                 else
                   list.page(params[:page])
                 end
  end

  private

  def user_not_authorized
    flash[:alert] = 'Вам необходимо войти в систему или зарегистрироваться для выполнения этого действия'
    redirect_to root_path
  end
end
