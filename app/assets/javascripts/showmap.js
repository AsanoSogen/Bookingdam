

function initMap(){

    map = new google.maps.Map(document.getElementById('show_map'), { 
        center: {lat: gon.lat, lng: gon.lng},
        zoom: 15, 
    });

    marker = new google.maps.Marker({ 
        position:  {lat: gon.lat, lng: gon.lng}, 
        map: map 
    });
}

    