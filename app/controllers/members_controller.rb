class MembersController < ApplicationController
    before_action :current_member
    
    def new
        @member=Member.new
    end
    
    def create
        @member=Member.new(member_params)
        if @member.valid?
            @member.save
            session[:member_id]=@member.id
            redirect_to member_path(@member)
        else
            render 'users/new'
        end
    end
    
    def show
        @member=Member.find(params[:id].to_i)
        @projects=@member.projects
    end
    
    def edit 
        @member=Member.find(params[:id].to_i)
    end
    
    def update
        @member=Member.find(params[:id].to_i)
        @member.update(member_params)
        redirect_to member_path(@member)
    end
    
    def learn
        @member=current_member
    end
    
    
    private
    
    def member_params
        params.require(:member).permit(:email, :username, :password, :grad_year, :github_username, :status, :role, :name, :bio )
    end
end
