class AdminController < ApplicationController
    before_action :admin?
    
    def home
        @meetings=Meeting.all
        @members=Member.all
        @meeting=Meeting.new
        @member=Member.new
        @current=current_member
        render "admin/dashboard"
    end

end
