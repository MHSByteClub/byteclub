class SessionsController < ApplicationController
    def create
        @member=Member.find_by(email: session_params[:email])
        if @member && @member.authenticate(session_params[:password])
            session[:member_id]=@member.id
            redirect_to member_path(@member)
        else
            redirect_to root_path
        end
    end
    
    def destroy
        session[:member_id].destroy
    end
    
    
    private
    
    def session_params
        params.require(:member).permit(:email, :password)
    end
end