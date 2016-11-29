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


$(function(){
    $("#submit").click(function(event){
    event.preventDefault()
    var searchInfo = $('#search').val()
    // console.log(searchInfo)
    $.ajax({
      url:"/locations/"+searchInfo,
      method: "POST",
      success: function(data,success,xhr){

      },
      error: function(xhr, data, error){
        console.log("error is "+ error)
      }
    });
    })
   


});