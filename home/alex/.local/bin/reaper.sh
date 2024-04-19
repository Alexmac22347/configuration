xfconf-query -c xfwm4 -p /general/easy_click -s None
xfconf-query -c xfwm4 -p /general/titleless_maximize -s false
reaper $1
xfconf-query -c xfwm4 -p /general/easy_click -s Alt
xfconf-query -c xfwm4 -p /general/titleless_maximize -s true
