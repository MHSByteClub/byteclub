class MeetingSerializer < ActiveModel::Serializer
    attributes :id, :date, :active, :content
     
end