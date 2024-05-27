# frozen_string_literal: true

class AddAdmin < ActiveRecord::Migration[7.1]
  def change
    User.find_by(email: 'kadina.aziev@mail.ru').update(admin: true)
  end
end
