class WelcomeController < ApplicationController

    def home
        @next_meeting=Meeting.upcoming
        if(logged_in?)
            redirect_to member_path(current_member)
        end
    end
    

end
