class MeetingsController < ApplicationController

    def index
        @meetings=Meeting.all
        render json: @meetings
    end
    
    
    def show
        @meeting=Meeting.find(params[:id].to_i)
    end
    
    
    
    
    private
    
    def meeting_params
        params.require(:meeting).permit(:date, :start_time, :end_time, :location, :content, :active)
    end
end
