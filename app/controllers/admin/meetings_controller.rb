class Admin::MeetingsController < AdminController
    before_action :admin?

    def new
        @meeting=Meeting.new
    end
    
    def create
        @meeting=Meeting.new(meeting_params)
        if @meeting.valid?
            @meeting.save
            redirect_to admin_meetings_path
        else
            render 'admin/meetings/new'
        end
    end
    
    def index
        @meetings=Meeting.all
    end
    
    
    def show
        @meeting=Meeting.find(params[:id].to_i)
    end
    
    def edit 
        @meeting=Meeting.find(params[:id].to_i)
    end
    
    def update
        @meeting=Meeting.find(params[:id].to_i)
        @meeting.update(meeting_params)
        redirect_to admin_meetings_path
    end
    
    
    private
    
    def meeting_params
        params.require(:meeting).permit(:date, :start_time, :end_time, :location, :content, :active)
    end
end
