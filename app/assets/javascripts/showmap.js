$(function(){
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: { scrollwheel: false }, internal: {id: 'show_map'}}, function(){
      markers = handler.addMarkers([
        {
          "lat": gon.lat,
          "lng": gon.lng,
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(16);
    });
});