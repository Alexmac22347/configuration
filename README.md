# fresh install
gvfs-backends - make phone show up as usb device
fonts-noto-cjk - normal looking japanese font
xserver-xorg-input-synaptics - circular scrolling (maybe not needed?)

```apt-get remove --purge atril snapd parole```  
```apt-get install blueman gvfs-backends fonts-noto-cjk xserver-xorg-input-synaptics xfce4-whiskermenu-plugin easytag tinc vlc okular audacity screen xinput vim git htop fonts-terminus keepass2 unclutter powertop```  
```git config --global core.editor vim```  
```git config --global user.name "aikm94"```  
```git config --global user.email "aikm94@ymail.ne.jp"```  
```git config --global pull.rebase true```   

Install steam, minecraft, anki (version 25.02, latest version breaks fcitx/japanese input), reaper


https://askubuntu.com/questions/479465/how-can-i-disable-alt-scroll-zoom-in-xfce4-xubuntu

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
sudo apt-get install fcitx fcitx-mozc
```
logout -> login  
fcitx -> remove current input and set mozc as the input
change system UI language:
```
sudo dpkg-reconfigure locales
```
select ja_JP.UTF-8

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
set browser.tabs.hoverPreview.enabled false (disable showing tab preview on hover)

https://support.mozilla.org/en-US/kb/compact-mode-workaround-firefox
right click on bookmark toolbar and set it to always show.
change search engine to yahoo japan or preferred search. change homepage to yahoo.co.jp or preferred home


## files manage
add download/documents to favourites
