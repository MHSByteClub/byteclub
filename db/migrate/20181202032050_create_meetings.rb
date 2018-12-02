class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.date :date
      t.time :start_time, default: "3:30 PM"
      t.time :end_time
      t.boolean :active, default: false
      t.string :location, default: "C104"
      t.text :content

      t.timestamps
    end
  end
end
