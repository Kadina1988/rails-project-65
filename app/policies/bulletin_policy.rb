# frozen_string_literal: true

class BulletinPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    @user && @user.admin?
  end

  def on_moderation?
    @user && @user.admin?
  end

  def publish?
    @user && @user.admin?
  end

  def reject
    @user && @user.admin?
  end

  def new?
    @user != @current_user
  end

  def create?
    @user != @current_user
  end

  def edit?
    @post.user == @user
  end

  def update?
    @post.user == @user
  end

  def to_moderate?
    @post.user == @user
  end

  def archive?
    @post.user == @user || @user.admin?
  end
end
