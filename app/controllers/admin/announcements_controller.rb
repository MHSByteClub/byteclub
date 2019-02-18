class Admin::AnnouncementsController < AdminController
    protect_from_forgery with: :null_session
    layout "admin"
    
    def new
        @announcement=Announcement.new
        @current=current_member
    end
    
    def create
        @announcement=Announcement.new(announcement_params)
        @announcement.update(member_id: current_member.id)
        redirect_to dashboard_path
    end
    
    def index
        @announcements=Announcement.all
        render json: @announcements
    end
    
    
    def show
        @announcement=Announcement.find(params[:id].to_i)
        render json: @announcement
    end
    
    def edit 
        @announcement=Announcement.find(params[:id].to_i)
    end
    
    def update
        @announcement=Announcement.find(params[:id].to_i)
        @announcement.update(announcement_params)
        @announcement.active ? @announcement.start : @announcement.stop
        render json: Announcement.all
    end
    
    
    private
    
    def announcement_params
        params.require(:announcement).permit(:title, :content, :post_date, :type)
    end
end
