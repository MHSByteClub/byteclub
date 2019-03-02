/*
//=require admin_meetings
//=require admin_announcements

*/

//anonymous function called on document load
const buildDashboard=function(){
    //Check if the admin_meetings div exists, we must be on the dashboard page
    console.log("this is loaded");
    if($("#dashboard-tabs").length>0){
        //GET request to pull all meetings as json and build table 
        $.get(window.location.href.replace("/dashboard","/admin/meetings")).done(function(resp){
            let meetings=resp;
            buildMeetingsTable(meetings);
        });
        
        $.get(window.location.href.replace("/dashboard","/admin/announcements")).done(function(resp){
            let anns=resp;
            buildAnnouncementList(anns);
        })
        
        
        //POSTS new meeting and rebuilds meeting table
        $('.new_meeting').submit(function(event){
            
            event.preventDefault();
            let data=$(this).serialize();
            let targetURL=window.location.href.replace('dashboard',`admin/meetings`);
            let updating=$.post(targetURL,data);
            updating.done(function(data){
                $('#new_meeting_modal').modal('toggle');
                $('.new_meeting').trigger('reset');
                
                buildMeetingsTable(data);
            });
        });
    }
};


