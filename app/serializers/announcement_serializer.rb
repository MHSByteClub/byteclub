class AnnouncementSerializer < ApplicationSerializer
    belongs_to :member, serializer: AnnouncementMemberSerializer

    attributes :title, :content, :post_date, :member
     
end