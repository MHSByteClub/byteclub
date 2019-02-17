class Meeting < ApplicationRecord

    scope :next_meeting, -> { where("date > ?", Date.today ).order("date asc").first }
    scope :upcoming_meetings, -> {where("date > ?", Date.today).order("date asc") }
    scope :past, -> { where("date < ?", Date.today) }
    scope :active_meetings, -> { where(active: true) }

    has_many :member_meetings
    has_many :members, through: :member_meetings
    
    def members_count
        self.members.count
    end
    
    def start
        puts "Starting meeting"
        self.update(start_time: Time.now())
    end
    
    def stop
        puts "stopping meeting"
        self.update(end_time: Time.now())
    end
    
    #returns the next upcoming meeting
    def self.announce
        if self.active_meetings.length==0
            if self.upcoming_meetings.length>0
                self.next_meeting
            else
                return nil
            end
        else
            self.active_meetings.order('date asc').first
        end
    end
    
    
    #Returns array of past meeting attendance to power admin dashboards
    def self.meetings_attendance
        self.past.map { |mtg| [mtg.date, mtg.members.count]}
    end
        
    
end
