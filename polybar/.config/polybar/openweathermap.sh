#!/bin/sh

get_icon() {
    case $1 in
        # Icons for weather-icons
        # clear sky
        01d) icon="";;
        01n) icon="";;
        # few clouds
        02d) icon="";;
        02n) icon="";;
        # scattered clouds
        03*) icon="";;
        # broken clouds
        04*) icon="";;
        # drizzle
        09d) icon="";;
        09n) icon="";;
        # rain
        10d) icon="";;
        10n) icon="";;
        # thunderstorm
        11d) icon="";;
        11n) icon="";;
        # freezing rain
        13d) icon="";;
        13n) icon="";;
        # fog
        50d) icon="";;
        50n) icon="";;
        # everything else
        *) icon="";

        # Icons for Font Awesome 5 Pro
        #01d) icon="";;
        #01n) icon="";;
        #02d) icon="";;
        #02n) icon="";;
        #03d) icon="";;
        #03n) icon="";;
        #04*) icon="";;
        #09*) icon="";;
        #10d) icon="";;
        #10n) icon="";;
        #11*) icon="";;
        #13*) icon="";;
        #50*) icon="";;
        #*) icon="";
    esac

    echo $icon
}

KEY="5b3e4d2b1a1e9d453440f29c74a0a8bf"
CITY="Münster,DE"
UNITS="metric"
SYMBOL="°"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
    location=$(curl -sf "https://location.services.mozilla.com/v1/geolocate?key=geoclue")

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ -n "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

    echo "$(get_icon "$weather_icon")" "$weather_temp$SYMBOL"
fi
