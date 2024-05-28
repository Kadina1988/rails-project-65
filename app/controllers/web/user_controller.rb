module Web
  class UserController < ApplicationController
    def profile
      @bulletins = @current_user.bulletins
    end
  end
end
