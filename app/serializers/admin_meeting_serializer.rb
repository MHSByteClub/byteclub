class AdminMeetingSerializer < ActiveModel::Serializer
    attributes :id, :date, :active, :content, :start_time, :end_time
     
end