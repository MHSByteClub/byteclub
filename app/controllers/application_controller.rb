class ApplicationController < ActionController::Base
   layout :get_layout
   
   def get_layout
      if admin?
         "admin"
      elsif logged_in?
         "members"
      else
         "application"
      end
   end
         
            
   
    
   def current_member
       return unless session[:member_id]
       @me ||= Member.find(session[:member_id])
   end
   
   def logged_in?
       current_member!=nil
   end
   
   def admin?
      if (logged_in? && current_member.role=="admin")
         true
      else
        false
      end
   end
   
   
   
       
end
