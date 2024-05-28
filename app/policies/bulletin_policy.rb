# frozen_string_literal: true

class BulletinPolicy
  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    @user.admin?
  end
end
