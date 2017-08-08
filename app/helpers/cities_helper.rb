module CitiesHelper
  def weather_get(city_name)
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{city_name}&units=imperial&APPID=#{ENV["OPENWEATHER_KEY"]}")
  end
end
