class CreateMemberMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :member_meetings do |t|
      t.integer :member_id
      t.integer :meeting_id
    end
  end
end
