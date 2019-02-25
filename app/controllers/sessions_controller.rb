class SessionsController < ApplicationController
    def create
        
        #Only logging in with Google is allowed right now.
        @member=Member.from_omniauth(request.env["omniauth.auth"])
        #if @member && @member.authenticate(session_params[:password])
        
        #logging user in via session
        session[:member_id]=@member.id
        
        #get active meeting
        @meeting=Meeting.active_meetings.first
        
        #if there is an active meeting, record that this person 'attended' by signing in while active
        if !@meeting.nil?
            MemberMeeting.find_or_create_by(member_id: @member.id, meeting_id: @meeting.id)
        end
        
        
        redirect_to member_path(@member)
        
            
        #else
        #    redirect_to root_path
        #end
    end
    
    def destroy
        session[:member_id] = nil
        redirect_to root_path
    end
    
    def googleAuth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        member = Member.from_omniauth(access_token)
        session[:member_id]=member.id
        # Access_token is used to authenticate request made from the rails application to the google server
        member.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        member.google_refresh_token = refresh_token if refresh_token.present?
        member.save
        redirect_to member_path(member)
    end
    
    
    private
    
    def session_params
        params
    end
end