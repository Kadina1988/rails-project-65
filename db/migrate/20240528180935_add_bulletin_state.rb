class AddBulletinState < ActiveRecord::Migration[7.1]
  def change
    add_column :bulletins, :aasm_state, :string
  end
end
