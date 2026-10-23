xfconf-query -c xfwm4 -p /general/easy_click -s None
xfconf-query -c xfwm4 -p /general/titleless_maximize -s false
steam steam://rungameid/16179090513566105600
# Wait for FL Studio window to appear, then wait for it to close
while ! xdotool search --name "FL Studio" 2>/dev/null | head -1; do
    sleep 1
done

# Now wait for the window to disappear
while xdotool search --name "FL Studio" 2>/dev/null | head -1; do
    sleep 2
done
xfconf-query -c xfwm4 -p /general/easy_click -s Alt
xfconf-query -c xfwm4 -p /general/titleless_maximize -s true
