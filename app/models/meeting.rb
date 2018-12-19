class Meeting < ApplicationRecord
    
    scope :next_meeting, -> { where("date > ?", Date.today ).order("date asc").first }
    scope :past, -> { where("date < ?", Date.today) }
    scope :active_meetings, -> { where(active: true) }

    has_many :member_meetings
    has_many :members, through: :member_meetings
    
    
    
    def self.announce
        if self.active_meetings.length==0
            self.next_meeting
        else
            self.active_meetings.order('date asc').first
        end
    end
    
    
    #Returns array of past meeting attendance to power admin dashboards
    def self.meetings_attendance
        self.past.map { |mtg| [mtg.date, mtg.members.count]}
    end
        
    
end
