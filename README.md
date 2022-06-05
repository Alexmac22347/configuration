# fresh install

```apt-get remove --purge atril snapd parole```  
```apt-get install easytag vlc okular audacity screen xinput vim git htop wireshark nmap fonts-terminus anki keepass2 gparted unclutter clangd-9 powertop```  
```git config --global core.editor vim```  
```git config --global user.name "alexmac22347"```  
```git config --global user.email "alexmac22347@protonmail.com"```  
```git config --global pull.rebase true```   

Install steam, minecraft, discord (on debian 11, install via tarball), zoom

## japanese input (ubuntu)
1. Open language support
2. Install Japanese Language
3. Open fcitx configuration
4. Click plus button, unclick "Only show current language", 
   add Mozc (sometimes due to a 
   bug nothing shows up here. Just reopen fcitx configuration).
5. Trigger input method -> change to Ctrl+Alt+J

## japanese input (debian)
install ibus and ibus-anthy
in ibus settings, set anthy as the only input
in ibus-anthy setup, add a key binding, on_off -> alt+ctrl+j
and on_off -> zenkaku_hankaku.

## keyboard repeat
delay: 240  
speed: 40  

## application shortcuts (keyboard)
exo-open --launch TerminalEmulator  Ctrl+Alt+T  
xfce4-popup-whiskermenu Super+L  
xfce4-screenshooter -f Print  
xfce4-screenshooter -r Shift+Print  
xfce4-screenshooter -w Alt+Print  
xfce4-taskmanager Ctrl+Alt+Delete  
xflock4 Ctrl+Alt+L  
xkill Ctrl+Alt+X  

## window manager tweaks + window manager + appearance
change window manager to Daloa  
accessibility -> hide title of windows when maximized (on)  
accessibility -> automatically tile windows when moving toward the screen edge (off)  
disable compositor  
move taskbar to left side  
use elementary-xfce-icon-theme

## firefox settings
set ui.key.menuAccessKeyFocuses false (disable alt menu)  

## eGPU
Install drivers:
```https://wiki.debian.org/NvidiaGraphicsDrivers#Debian_11_.22Bullseye.22```
install egpu switching script. This will set up the right xorg.conf files
so that you use the egpu when its available, and internal gpu otherwise
https://github.com/hertg/egpu-switcher#other

# thinkpad dock script
install tp-smapi-dkms (debian)  
create /etc/acpi/events/thinkpad-dock:  
```
event=ibm/hotkey LEN0068:00 00000080 00006030
action=su root -c "/usr/bin/dock.sh"
``` 

create /etc/acpi/events/thinkpad-undock:  
```
event=ibm/hotkey LEN0068:00 00000080 00004011
action=su root -c "/usr/bin/dock.sh"
```  

```
sudo systemctl restart acpid.service
```

If window manager fails to start, try removing .xsessionrc.
