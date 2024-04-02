class AllowUserChangePasswors < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :allow_password_change, :boolean, default: true
  end
end
