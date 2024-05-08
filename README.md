# fresh install

```apt-get remove --purge atril snapd parole```  
```apt-get install xserver-xorg-input-synaptics xfce4-whiskermenu-plugin easytag tinc vlc okular audacity screen xinput vim git htop wireshark nmap fonts-terminus anki keepass2 gparted unclutter clangd-9 powertop```  
```git config --global core.editor vim```  
```git config --global user.name "alexmac22347"```  
```git config --global user.email "alexmac22347@protonmail.com"```  
```git config --global pull.rebase true```   

Install steam, minecraft, discord, zoom

update default editor  
'''sudo update-alternatives --config editor'''

add user alex to sudoers  
```
su -
usermod -aG sudo alex
```   

Remove dock at the bottom of the screen  
 - right click on any panel
 - at the top select panel 2
 - click the minus button

use whisker menu  
 - right click on desk top toolbar/panel
 - panel preferences -> items -> add
 - add whisker menu, remove default xfce one

remove workspaces  
 - open whisker menu
 - search workspaces
 - change to 1
 - also remove from panel preferences -> items

xfce terminal settings
 - settings -> general -> scrollbar -> disabled
 - settings -> appearance -> display menubar in new windows -> uncheck
 - settings -> advanced -> shortcuts -> disable all
 - righclick terminal -> disable menubar

## Japanese setup  
```
sudo apt-get remove --purge ibus
sudo apt-get install fcitx fcitx-mozc
```
logout -> login  
fcitx -> remove current input and set mozc as the input  

## keyboard repeat
delay: 280  
speed: 30  

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
in the url go to about:config
set ui.key.menuAccessKeyFocuses false (disable alt menu)  
set browser.compactmode.show true (allow compact mode)
set browser.uidensity 1 (set compact mode)
set toolkit.legacyUserProfileCustomizations.stylesheets true (allow userChrome.css)
