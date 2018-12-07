class WelcomeController < ApplicationController
    def home
        @next_meeting=Meeting.announce
        if(logged_in?)
            redirect_to member_path(current_member)
        end
    end
    

end
