# Check to see if the popup terminal already is running.
# if not, create it again, then show it. Otherwise, just show it.
POPUPEXISTS=`xwininfo -tree -root | grep "scratchpad_urxvt"`

# ifPOPUPEXISTS is empty, create a new terminal
if [ -z "$POPUPEXISTS" ]; then
    # Sometimes the server will already be running, which is OK (this command will just fail)
    # This is because once the server is started, it will close after 10 seconds if no terminals are
    # associated with it.
    urxvt -name scratchpad_urxvt
fi

i3 [instance="scratchpad_urxvt"] scratchpad show
