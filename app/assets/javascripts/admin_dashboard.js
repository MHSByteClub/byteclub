//anonymous function called on document load
$(function(){
    //Check if the admin_meetings div exists, we must be on the dashboard page
    if($(".admin_meetings.index").length>0){
        console.log('you at the dashboard');
        
        
        //if we are, go get the admin/meetings json
        $.get(window.location.href.replace("/dashboard","/admin/meetings")).done(function(resp){
            let meetings=resp;
            buildMeetingsTable(meetings);
        });
    }
    
        
    
});


function buildMeetingsTable(mtgs){
    let mtgsList=$("#meetings-list")[0];
    mtgs.forEach(function(mtg,index){
        let mtgItem=$(`<li class='list-group-item' data-id='${mtg.id}'>${mtg.date}</li>`)
        mtgsList.append(mtgItem[0]);
    });
}