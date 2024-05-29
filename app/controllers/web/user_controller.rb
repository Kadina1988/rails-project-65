module Web
  class UserController < ApplicationController
    def profile
      @bulletins = @current_user.bulletins.first_new
    end
  end
end
