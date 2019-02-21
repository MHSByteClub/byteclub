class WelcomeController < ApplicationController
    def home
        @next_meeting=Meeting.announce
        @announcements=Announcement.all
        @me=current_member
    end
    

end
