KEYBOARD_JP="XKBMODEL=\"pc105\"\nXKBLAYOUT=\"jp\"\nXKBVARIANT=\"\"\nXKBOPTIONS=\"ctrl:nocaps\"\n\nBACKSPACE=\"guess\""
KEYBOARD_US="XKBMODEL=\"pc105\"\nXKBLAYOUT=\"us\"\nXKBVARIANT=\"\"\nXKBOPTIONS=\"ctrl:nocaps\"\n\nBACKSPACE=\"guess\""

DOCKED=$(cat /sys/devices/platform/dock.2/docked)
if [[ $DOCKED == "1" ]]; then
    echo -e $KEYBOARD_US > /etc/default/keyboard
elif [[ $DOCKED == "0" ]]; then
    echo -e $KEYBOARD_JP > /etc/default/keyboard
fi

udevadm trigger --subsystem-match=input --action=change
