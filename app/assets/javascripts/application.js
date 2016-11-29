// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// var mapOptions = {
//     center: new google.maps.LatLng(37.7831,-122.4039),
//     zoom: 12,
//     mapTypeId: google.maps.MapTypeId.ROADMAP
// };

// new google.maps.Map(document.getElementById('map'), mapOptions);


var map;
 $(function(){
   $("#submit").click(function(event){
     event.preventDefault();
     var information = $("#info").val()
     console.log(information)
 
     var map
     function initMap() {
       $.ajax({
         url:"/resturants_info",
         method: "GET",
         dataType: "JSON",
         success: function(data, success, xhr){
       map = new google.maps.Map(document.getElementById('map'), {
       center: {lat: data.region.center.latitude, lng: data.region.center.longitude},
       zoom: 12
       });
           var dat = (data.businesses)
           // console.log(dat)
           var places = []
           for(var i = 0; i<dat.length; i++){
           // console.log(typeof dat[i].location.coordinate.latitude)
           // console.log("name is " + dat[i].name +" location is "+ dat[i].location.coordinate.latitude +" "+ dat[i].location.coordinate.longitude)
           places.push({name: dat[i].name, latitude: dat[i].location.coordinate.latitude, longitude: dat[i].location.coordinate.longitude});
           // lat.push(dat[i].location.coordinate.longitude);
           }
           // console.log(places)
           for(var i =0; i<places.length; i++){
             var marker = new google.maps.Marker({
               position: {lat: places[i].latitude, lng: places[i].longitude},
               map: map,
               title: places[i].name
             });
             marker.setMap(map)
           }
         },
         error: function(xhr, data, error){
           console.log("error is "+error);
         }
       });
     }
     google.maps.event.addDomListener(window, 'load', initMap());
   })
 })