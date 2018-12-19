class AdminController < ApplicationController
    before_action :admin?
    
    def home
        render "admin/dashboard"
    end

end
