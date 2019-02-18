
function buildAnnouncementList(anns){
    //Get announcement list container and clear it out
    let annsList=$("#announcements-list")[0];
    annsList.innerHTML="";
    
    //For each announcement in the list
    anns.forEach(function(ann){
        let annItem=renderAnnRow(ann);
        annsList.append(annItem[0]);
    });
}


//Renders a single announcement list item/row from a announcement object
function renderAnnRow(ann){
    let annItem=$(`
        <div class="list-group-item flex-column align-items-start">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1"><a href="/admin/announcements/${ann.id}">${ann.title}</a></h5>
                <small>${ann.post_date}</small>
            </div>
            <p class="mb-1">${ann.content}</p>
            <small>${ann.member.username}, ${ann.member.role}</small>
            <a href="${window.location.href.replace("dashboard","admin/announcements/")}${ann.id}/edit" class="btn btn-small btn-green">Edit</a>
        </div>
        `);
    return annItem;
}


//Renders a set of control buttons for each of the announcements in the list
function renderAnnouncementControls(ann){
    let controlDiv=$("<div class='item-controls'></div>");
    let btnText="Start";
    let btnClass="green";
    if(ann.end_time===null && ann.active){
        btnText="End";
        btnClass="danger";
    }
    let f;
    
    //GOTCHA - The form must include the hidden field with the name "_method" and value "patch" for the jquery post to function properly.
    if(ann.end_time===null){
        f=$(`
            <form class="toggle-active" data-id='${ann.id}' method='POST'>
                <input type="hidden" name="_method" value="PATCH"/>
                <input type='hidden' name="announcement[active]" value="${ !ann.active}"/>
                <button class="btn btn-small btn-${btnClass}" type="submit">${btnText}</button>
            </form>`
        );
        f.submit(function(event){
            event.preventDefault();
            let data=$(this).serialize();
    
            let targetURL=window.location.href.replace('dashboard',`admin/announcements/${this.dataset.id}`);
            console.log(targetURL);
    
            let updating=$.post(targetURL,data);
            
            updating.done(function(data){
                buildAnnouncementsTable(data);
            });
        });
    } else {
        f=$("<span></span>");
    }
    controlDiv.append(f);
    return controlDiv;
}
