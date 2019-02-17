class Admin::MeetingsController < AdminController
    protect_from_forgery with: :null_session

    
    def new
        @meeting=Meeting.new
    end
    
    def create
        @meeting=Meeting.new(meeting_params)
        @meeting.save
        render json: Meeting.all
    end
    
    def index
        @meetings=Meeting.all
        render json: @meetings
    end
    
    
    def show
        @meeting=Meeting.find(params[:id].to_i)
        render json: @meeting
    end
    
    def edit 
        @meeting=Meeting.find(params[:id].to_i)
    end
    
    def update
        @meeting=Meeting.find(params[:id].to_i)
        @meeting.update(meeting_params)
        render json: Meeting.all
    end
    
    
    private
    
    def meeting_params
        params.require(:meeting).permit(:date, :start_time, :end_time, :location, :content, :active)
    end
end
