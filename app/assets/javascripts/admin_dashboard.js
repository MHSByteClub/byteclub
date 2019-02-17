

//anonymous function called on document load
$(function(){
    //Check if the admin_meetings div exists, we must be on the dashboard page
    if($(".admin_meetings.index").length>0){
        
        
        //if we are, go get the admin/meetings json
        $.get(window.location.href.replace("/dashboard","/admin/meetings")).done(function(resp){
            let meetings=resp;
            
            //populate and build the meetings table
            buildMeetingsTable(meetings);
            
        });
        
        $('#new-meeting-form').submit(function(event){
            event.preventDefault();
            let data=$(this).serialize();

            let targetURL=window.location.href.replace('dashboard',`admin/meetings`);

            let updating=$.post(targetURL,data);
            
            updating.done(function(data){
                buildMeetingsTable(data);
            });
            
            
        })
    }
});


function buildMeetingsTable(mtgs){
    //Get meeting list container and clear it out
    let mtgsList=$("#meetings-list")[0];
    mtgsList.innerHTML="";
    
    //For each meeting in the list
    mtgs.forEach(function(mtg,index){
        
        let mtgItem=$(`<li class='list-group-item ${mtg.active ? "active":""}' data-id='${mtg.id}'>${mtg.date}: ${mtg.content}</li>`)
        let toggleButton=buildActivateButton(mtg).submit(function(event){
            event.preventDefault();
            let data=$(this).serialize();

            let targetURL=window.location.href.replace('dashboard',`admin/meetings/${this.dataset.id}`);
            console.log(targetURL);

            let updating=$.post(targetURL,data);
            
            updating.done(function(data){
                buildMeetingsTable(data);
            });
        });
        mtgItem.append(toggleButton);
        mtgsList.append(mtgItem[0]);
    });
}

function buildActivateButton(mtg){
    let btnText="Start";
    let btnClass="green";
    //GOTCHA - The form must include the hidden field with the name "_method" and value "patch" for the jquery post to function properly.
    if(mtg.end_time===null && mtg.active){
        btnText="End";
        btnClass="danger";
    }
    
    const f=$(`<form class="toggle-active" data-id='${mtg.id}' method='POST'><input type="hidden" name="_method" value="PATCH"/><input type='hidden' name="meeting[active]" value="${ !mtg.active}"/><button class="btn btn-small btn-${btnClass}" type="submit">${btnText}</button>`);
    return f;
}

