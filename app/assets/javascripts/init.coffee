#Creates an app object on window, makes available throughout application
window.App ||= {}


#initializes the bootstrap tooltips, as a trial
App.init = ->
    $("a, span, i, div").tooltip()
    
#Calls App.init when turbolinks load, which happens on document.load
$(document).on "turbolinks:load", ->
    App.init();
    buildDashboard();