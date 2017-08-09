// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {
  $('#submitWeather').on('click', onClickGetWeatherData);
});

function show(data){
  return "<h2 style='font-size:40px; font-weight: bold; class='text-center'> Current Weather for " + data.name + "," +
  data.sys.country + "</h2>" +
         "<h3><strong>Weather</strong>: " + data.weather[0].main + "</h3>" +
         "<h3><strong>Description</strong>: " + data.weather[0].description + "</h3>" +
         "<h3><strong>Temperature</strong>: " + data.main.temp + "</h3>" +
         "<h3><strong>Presure</strong>: " + data.main.pressure + "</h3>" +
         "<h3><strong>Humidity</strong>: " + data.main.humidity + "</h3>" +
         "<h3><strong>Low Temperature</strong>: " + data.main.temp_min + "</h3>" +
         "<h3><strong>Max Temperature</strong>: " + data.main.temp_max + "</h3>" +
         "<h3><strong>Wind Speed</strong>: " + data.wind.speed + "</h3>" +
          "<h3><strong>Wind Direction</strong>: " + data.wind.deg + "</h3>";
};

function onClickGetWeatherData(){
  getWeatherData($("#city").val());
}

function getWeatherData(city){
    if(city != ''){
      $.ajax({
        url: 'http://api.openweathermap.org/data/2.5/weather?q=' + city + "&units=imperial" + "&APPID=0663c7dc6c05d3263610ca7258005ff6",
        type: "GET",
        dataType: "jsonp",
        success: function(data) {

          var widget = show(data);

          $("#show").html(widget);

        }
      });
    }else{
      $("#error").html('Field cannot be empty');
    }
};
