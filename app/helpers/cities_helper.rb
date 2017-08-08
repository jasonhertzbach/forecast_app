module CitiesHelper
  def weather_get(city_name)
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city_name}&units=imperial&APPID=153299fceea0f01a9ebe672e4785e28e")
  end
end
