class AnnouncementSerializer < ApplicationSerializer
    belongs_to :member, serializer: AnnouncementMemberSerializer

    attributes :id,:title, :content, :post_date, :member
     
end