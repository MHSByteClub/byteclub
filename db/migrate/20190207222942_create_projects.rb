class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :member_id
      t.string :url
      t.string :status

      t.timestamps
    end
  end
end
