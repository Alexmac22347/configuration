# fresh install

```apt-get remove --purge atril snapd parole```  
```apt-get install easytag vlc okular audacity screen xinput vim git htop wireshark nmap fonts-terminus anki keepass2 gparted unclutter clangd-9 powertop```  
```git config --global core.editor vim```  
```git config --global user.name "alexmac22347"```  
```git config --global user.email "alexmac22347@protonmail.com"```  
```git config --global pull.rebase true```   

Install steam, minecraft.

## japanese input (ubuntu)
1. Open language support
2. Install Japanese Language
3. Open fcitx configuration
4. Click plus button, unclick "Only show current language", 
   add Mozc (sometimes due to a 
   bug nothing shows up here. Just reopen fcitx configuration).
5. Trigger input method -> change to Ctrl+Alt+J

## japanese input (debian)
install ibus and ibus-mozc

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

## firefox settings
set ui.key.menuAccessKeyFocuses false (disable alt menu)  

# thinkpad dock script
install tp-smapi-dkms (debian)  
create /etc/acpi/events/thinkpad-dock:  
```
event=ibm/hotkey LEN0068:00 00000080 00006030
action=su alex -c "/home/alex/bin/external-monitor dock"
``` 

create /etc/acpi/events/thinkpad-undock:  
```
event=ibm/hotkey LEN0068:00 00000080 00004011
action=su alex -c "/home/francois/alex/external-monitor undock"
```  

```
sudo systemctl restart acpid.service
```

If window manager fails to start, try removing .xsessionrc.
