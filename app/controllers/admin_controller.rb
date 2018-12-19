class AdminController < ApplicationController
    before_action :admin?
    
    def home
        @meetings=Meeting.all
        @members=Member.all
        render "admin/dashboard"
    end

end
