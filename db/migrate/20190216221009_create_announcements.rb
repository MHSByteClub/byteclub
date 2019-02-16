class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :content
      t.date :post_date
      t.integer :member_id
      t.string :type

      t.timestamps
    end
  end
end
