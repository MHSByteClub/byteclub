class Announcement < ApplicationRecord
    belongs_to :member
    
    scope :active, -> { where("post_date <= ?", Date.today) }
    scope :upcoming, -> { where("post_date >= ?", Date.today) }
    
    
    #CLASS METHODS
    def self.recent_announcements
        today=Date.today
        self.active.order("post_date DESC").limit(3)
    end
end
