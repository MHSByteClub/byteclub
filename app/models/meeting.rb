class Meeting < ApplicationRecord
    
    scope :next_meeting, -> { where("date > ?", Date.today ).order("date asc").first }
    scope :past, -> { where("date < ?", Date.today) }
    scope :active, -> { where(active: true).first }
    
    
    
    def self.upcoming
        if self.active
            self.active
        else
            self.next_meeting
        end
    end
        
    
end
