class Meeting < ApplicationRecord
    
    scope :next_meeting, -> { where("date > ?", Date.today ).order("date asc").first }
    scope :past, -> { where("date < ?", Date.today) }
    scope :active_meetings, -> { where(active: true) }
    
    
    
    def self.announce
        if self.active_meetings.length==0
            self.next_meeting
        else
            self.active_meetings.order('date asc').first
        end
    end
        
    
end
