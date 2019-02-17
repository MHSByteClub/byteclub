class ApplicationController < ActionController::Base
    
   def current_member
       return unless session[:member_id]
       @member ||= Member.find(session[:member_id])
   end
   
   def logged_in?
       current_member!=nil
   end
   
   def admin?
      if (logged_in? && current_member.role=="admin")
         return
      else
         redirect_to root_path
      end
   end
   
       
end
