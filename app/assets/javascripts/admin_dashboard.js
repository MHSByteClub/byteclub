/*
//=require admin_meetings
//=require admin_announcements

*/

//anonymous function called on document load
$(function(){
    //Check if the admin_meetings div exists, we must be on the dashboard page
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
});

/*
function buildMeetingsTable(mtgs){
    //Get meeting list container and clear it out
    let mtgsList=$("#meetings-list")[0];
    mtgsList.innerHTML="";
    
    //For each meeting in the list
    mtgs.forEach(function(mtg){
        let mtgItem=renderMeetingRow(mtg);
        mtgsList.append(mtgItem[0]);
    });
}


//Renders a single meeting list item/row from a meeting object
function renderMeetingRow(mtg){
    let mtgItem=$(`<li class='list-group-item ${mtg.active ? "active":""}' data-id='${mtg.id}'>${mtg.date}: ${mtg.content}</li>`);
    let mtgControls=renderMeetingControls(mtg);
    mtgItem.append(mtgControls);
    if(mtg.end_time!==null){
        mtgItem.addClass("list-group-item-light");
    }
    return mtgItem;
}


//Renders a set of control buttons for each of the meetings in the list
function renderMeetingControls(mtg){
    let controlDiv=$("<div class='item-controls'></div>");
    let btnText="Start";
    let btnClass="green";
    if(mtg.end_time===null && mtg.active){
        btnText="End";
        btnClass="danger";
    }
    let f;
    
    //GOTCHA - The form must include the hidden field with the name "_method" and value "patch" for the jquery post to function properly.
    if(mtg.end_time===null){
        f=$(`
            <form class="toggle-active" data-id='${mtg.id}' method='POST'>
                <input type="hidden" name="_method" value="PATCH"/>
                <input type='hidden' name="meeting[active]" value="${ !mtg.active}"/>
                <button class="btn btn-small btn-${btnClass}" type="submit">${btnText}</button>
            </form>`
        );
        f.submit(function(event){
            event.preventDefault();
            let data=$(this).serialize();
    
            let targetURL=window.location.href.replace('dashboard',`admin/meetings/${this.dataset.id}`);
            console.log(targetURL);
    
            let updating=$.post(targetURL,data);
            
            updating.done(function(data){
                buildMeetingsTable(data);
            });
        });
    } else {
        f=$("<span></span>");
    }
    controlDiv.append(f);
    return controlDiv;
}
*/
