class MeetingSerializer < ApplicationSerializer
    attributes :id, :date, :active, :content, :start_time, :end_time, :members_count
     
end