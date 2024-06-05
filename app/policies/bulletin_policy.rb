# frozen_string_literal: true

class BulletinPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    @user&.admin?
  end

  def on_moderation?
    @user&.admin?
  end

  def publish?
    @user&.admin?
  end

  def reject
    @user&.admin?
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
