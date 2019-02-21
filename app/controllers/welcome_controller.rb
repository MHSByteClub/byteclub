class WelcomeController < ApplicationController
    def home
        @next_meeting=Meeting.announce
        @announcements=Announcement.recent_announcements
        @me=current_member
    end
    

end
