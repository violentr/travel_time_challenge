$(document).on("turbolinks:load", (function() {

   var welcomeUrl = 'welcome/list_areas'

   var myOptions = {
     zoom: 13,
     center: new google.maps.LatLng(51.5200768,-0.0954517),
     mapTypeId: 'terrain'
   };

  var map = new google.maps.Map($('#map')[0], myOptions);

   $.get( welcomeUrl, function( data ) {
     $.each(data, function(_, coords) {
       var latlng = new google.maps.LatLng(coords.latitude, coords.longitude);
       new google.maps.Marker({
         position: latlng,
         map: map
       });

     });
   });
})
              );
