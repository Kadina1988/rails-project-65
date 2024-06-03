# frozen_string_literal: true

class CategoryPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    @current_user && @user.admin?
  end

  def new?
    @current_user && @user.admin?
  end

  def create?
    @current_user && @user.admin?
  end

  def edit?
    @current_user && @user.admin?
  end

  def update?
    @current_user && @user.admin?
  end

  def destroy?
    @current_user && @user.admin?
  end
end
