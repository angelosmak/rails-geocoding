import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

var map;
function initializeMap() {
  var mapOptions = {
    zoom: 10,
    // Additional map options
  };
  map = new google.maps.Map(document.getElementById('map'), mapOptions);
}
