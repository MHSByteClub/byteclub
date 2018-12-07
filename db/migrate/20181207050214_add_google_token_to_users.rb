class AddGoogleTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :google_token, :string
    add_column :members, :google_refresh_token, :string
  end
end
