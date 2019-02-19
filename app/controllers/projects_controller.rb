class ProjectsController < ApplicationController
    layout "members"
    
    def new
        @project=Project.new(member_id: params[:member_id])
        @member=Member.find(params[:member_id])
    end
    
    def create
        @project=Project.create(project_params)
        @member=current_member
        if @project.valid?
            @project.save
            redirect_to member_path(@member)
        else
            redirect_to new_member_project_path(@member)
        end
    end
    
    def show
        @project=Project.find(params[:id].to_i)
    end
    
    def edit
        @project=Project.find(params[:id].to_i)
        @member=current_member
    end
    
    def update
        @project=Project.find(params[:id].to_i)
        @project.update(project_params)
        redirect_to member_path(current_member)
    end
    
    def destroy
        @project=Project.find(params[:id].to_i)
        @project.destroy
        redirect_to member_path(current_member)
    end
    
    
    def project_params
        params.require(:project).permit(:name, :url, :status, :member_id, :description)
    end
end
