class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :email
      t.string :username
      t.integer :grad_year
      t.string :github_username
      t.string :status
      t.string :role
      t.string :level
      t.string :password_digest

      t.timestamps
    end
  end
end
