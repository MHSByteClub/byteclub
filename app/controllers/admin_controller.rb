class AdminController < ApplicationController
    before_action :admin?
    
    def home
        @meetings=Meeting.all
        @members=Member.all
        @meeting=Meeting.new
        @member=Member.new
        render "admin/dashboard"
    end

end
