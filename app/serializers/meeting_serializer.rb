class MeetingSerializer < ActiveModel::Serializer
    attributes :id, :date, :active, :content, :start_time, :end_time, :members_count
     
end