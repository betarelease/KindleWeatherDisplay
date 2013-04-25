require 'sinatra'
require 'weather'

get '/' do
  weather = Weather.new(37.5483, -121.9875)
  weather.fetch
  weather.process_svg
  `rsvg-convert --background-color=white -o weather-script-output.png weather-script-output.svg`
  `pngcrush -c0 w4 weather-script-output.png weather-output.png`
  `cp -f weather-output.png ~/Sites/weather-script-output.png`
end
