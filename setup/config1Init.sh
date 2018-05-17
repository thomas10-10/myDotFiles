####################
# cookbook config1 #
####################

config_tmp=config1_tmp

sed -i "s/nameserver/nameserver 8.8.8.8/g" /etc/resolv.conf
apt update
apt install iputils-ping -y
apt install i3 -y
apt install vim -y
apt install chromium -y
apt install xterm -y
###########################apt install atom################
apt install curl -y
apt install gnupg2 -y
curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | apt-key add -
echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any any main" >> /etc/apt/sources.list
apt install apt-transport-https -y
apt update
apt install atom -y
############################I3-gapps#############################
apt install git -y
apt install dh-autoreconf -y
apt install libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev -y
mkdir ~/$config_tmp/i3gaps
cd ~/$config_tmp/i3gaps
# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
make install
###########################POLYBAR##############
cd ~
apt install x11-xfs-utils -y
apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev -y
apt-get install cmake cmake-data libboost-dev libfreetype6-dev libxcb1-dev libx11-xcb-dev libxcb-util0-dev libxcb-image0-dev libxcb-randr0-dev libxcb-ewmh-dev libxcb-icccm4-dev xcb-proto python-xcbgen i3-wm libiw-dev libasound2-dev libmpdclient-dev -y
mkdir ~/$config_tmp/ipoly
cd ~/$config_tmp/poly
git clone --branch 3.1.0 --recursive https://github.com/jaagr/polybar
mkdir polybar/build
cd polybar/build
cmake ..
make install
###############################CONF POLYBAR#######
make userconfig

###enable bitmap 
cd /etc/fonts/conf.d/
rm /etc/fonts/conf.d/10*  
rm -rf 70-no-bitmaps.conf 
ln -s ../conf.avail/70-yes-bitmaps.conf .
dpkg-reconfigure fontconfig
cd ~

#siji
mkdir ~/$config_tmp/sij && cd ~/$config_tmp/sij
git clone https://github.com/stark/siji && cd siji
./install.sh
fc-cache
cd ~

apt install python3-pip -y
pip3 install pywal
apt install imagemagick -y
apt install alsa-utils -y
apt install ranger -y
apt install compton -y
apt install feh -y
#compton -c -r 4 -l -2 -t -4 -G -b
#lxc.cgroup.devices.allow = c 116:* rwm

###############################################################################################################################################################
#######
# RESS #
########
config_ress=config1_ress
mkdir -p ~/$config_ress/.config ; mkdir -p ~/$config_ress/.wallpapers ; mkdir -p ~/$config_ress/
###################
# File Wallpapers #
###################
curl -o ~/$config_ress/.wallpapers/forest-minimal.jpg https://raw.githubusercontent.com/thomas10-10/i3rice-From-scratch/master/config1/forest-minimal.jpg

###################
# File Xresources #
###################
cat <<"EOF" >~/$config_ress/.Xresources 
URxvt*font:     xft:mono:medium:size=10
xterm*faceName: xft:mono:medium:size=10

!*.font: xft:DejaVu :size=10
!URxvt.letterSpace: -1

Xft.dpi:                        96
Xft.antialias:                  1
Xft.autohint:                   1
Xft.hinting:                    1
Xft.hintstyle:                  hintslight
Xft.lcdfilter:                  lcdlight
Xft.rgba:                       rgb

URxvt*termName:                 rxvt-256color
URxvt.depth:                    32
URxvt*lineSpace:                1
URxvt.letterSpace:              -1
URxvt.iso14755:                 false
URxvt.iso14755_52:              false
URxvt*geometry:                 65x17
URxvt.scrollBar:                false
URxvt*loginShell:               true
URxvt.internalBorder:           25
URxvt.perl-ext:	 		default,matcher
URxvt.url-launcher:             firefox
URxvt.matcher.button: 		1
!URxvt.background: [40]blue
 
EOF
######
# I3 #
######
mkdir -p ~/$config_ress/.config/i3

##################
# FILE i3/config #
##################
cat <<'EOF' > ~/$config_ress/.config/i3/config
set $mod Mod4

font pango:monospace 8

floating_modifier $mod

bindsym $mod+Return exec i3-sensible-terminal

bindsym $mod+Shift+a kill

bindsym $mod+d exec dmenu_run -fn 'Overpass Mono:pixelsize=15' -l 3 -nf '#707880' -sf '#cc6666' -nb '#1d1f21' -sb '#1d1f21'

#bindsym $mod+d exec rofi

bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+m focus right

bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+m move right

bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

bindsym $mod+h split h

bindsym $mod+v split v

bindsym $mod+f fullscreen toggle

bindsym $mod+s layout stacking
bindsym $mod+z layout tabbed
bindsym $mod+e layout toggle split

bindsym $mod+Shift+space floating toggle

bindsym $mod+space focus mode_toggle

bindsym $mod+q focus parent

#bindsym $mod+d focus child

set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

bindsym $mod+ampersand workspace $ws1
bindsym $mod+eacute workspace $ws2
bindsym $mod+quotedbl workspace $ws3
bindsym $mod+apostrophe workspace $ws4
bindsym $mod+parenleft workspace $ws5
bindsym $mod+minus workspace $ws6
bindsym $mod+egrave workspace $ws7
bindsym $mod+underscore workspace $ws8
bindsym $mod+ccedilla workspace $ws9
bindsym $mod+agrave workspace $ws10

bindsym $mod+Shift+ampersand move container to workspace $ws1
bindsym $mod+Shift+eacute move container to workspace $ws2
bindsym $mod+Shift+quotedbl move container to workspace $ws3
bindsym $mod+Shift+apostrophe move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+minus move container to workspace $ws6
bindsym $mod+Shift+egrave move container to workspace $ws7
bindsym $mod+Shift+underscore move container to workspace $ws8
bindsym $mod+Shift+ccedilla move container to workspace $ws9
bindsym $mod+Shift+agrave move container to workspace $ws10

bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym m resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

new_window pixel 1

#new_window normal 0 px

#hide_edge_borders vertical

set $unfocused_border #1D1F21
set $focused_border #ffffff
#set $focused_border #808080
#set $focused_border #CC6666

client.focused          #ffffff #ffffff #ffffff #ffffff   $focused_border
client.focused_inactive #ffffff #ffffff #ffffff #ffffff   $focused_border
client.unfocused        #ffffff #ffffff #ffffff #ffffff   $unfocused_border
client.urgent           #ffffff #ffffff #ffffff #ffffff   $focused_border
client.placeholder      #ffffff #ffffff #ffffff #ffffff   #ffffff

client.background       #ffffff

exec_always --no-startup-id xrdb ~/.Xresources

exec_always --no-startup-id feh --bg-fill ~/.wallpapers/forest-minimal.jpg

exec_always --no-startup-id $HOME/.config/polybar/launch.sh
exec_always --no-startup-id wal -a70 -i ~/.wallpapers/forest-minimal.jpg

EOF
echo i3 config create
###########
# Polybar #
###########
mkdir -p ~/$config_ress/.config/polybar

#ls ~/$config_ress/.config/polybar/
> ~/$config_ress/.config/polybar/config
> ~/$config_ress/.config/polybar/launch.sh

#######################
# FILE polybar/config #
#######################
cat <<"EOF" > ~/$config_ress/.config/polybar/config

;=====================================================
;
;   To learn more about how to configure Polybar
;   go to https://github.com/jaagr/polybar
;
;   The README contains alot of information
;
;=====================================================

[colors]
;background = ${xrdb:color0:#222}

;background = #ffffff
background = #222
background-alt = #444
;foreground = ${xrdb:color7:#222}
foreground = #dfdfdf
foreground-alt = #ffffff
;foreground-alt = #555
primary = #ffb52a
secondary = #e60053
alert = #bd2c40

[bar/example]
;monitor = ${env:MONITOR:HDMI-1}
width = 100%
height = 20
;offset-x = 1%
;offset-y = 1%
radius = 0
fixed-center = false

background = ${colors.background}
foreground = ${colors.foreground}

line-size = 2
line-color = #f00

border-size = 0
border-color = #00000000

padding-left = 0
padding-right = 2

module-margin-left = 1
module-margin-right = 2

font-0 =  Siji:Regular:pixelsize=10;0
font-1 =  Siji:Bold:fontformat=truetype:size=8:antialias=false;0
font-2 =  Siji:Bold:pixelsize=10;1

modules-left = bspwm i3
modules-center = mpd
modules-right = filesystem xbacklight volume xkeyboard memory cpu wlan eth battery temperature date powermenu

tray-position = right
tray-padding = 2
;tray-transparent = true
;tray-background = #0063ff

;wm-restack = bspwm
;wm-restack = i3

;override-redirect = true

;scroll-up = bspwm-desknext
;scroll-down = bspwm-deskprev

;scroll-up = i3wm-wsnext
;scroll-down = i3wm-wsprev

cursor-click = pointer
cursor-scroll = ns-resize

[module/xwindow]
type = internal/xwindow
label = %title:0:30:...%

[module/xkeyboard]
type = internal/xkeyboard
blacklist-0 = num lock

format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
;format-prefix-background = ${colors.secondary}
;format-prefix-underline = ${colors.secondary}

label-layout = %layout%
;label-layout-underline = ${colors.secondary}
;label-layout-background = ${colors.secondary}
label-indicator-padding = 2
label-indicator-margin = 1
label-indicator-background = ${colors.secondary}
label-indicator-underline = ${colors.secondary}

[module/filesystem]
type = internal/fs
interval = 25

mount-0 = /

label-mounted = %{F#0a81f5}%mountpoint%%{F-}: %percentage_used%%
label-unmounted = %mountpoint% not mounted
label-unmounted-foreground = ${colors.foreground-alt}

[module/bspwm]
type = internal/bspwm

label-focused = %index%
label-focused-background = ${colors.background-alt}
label-focused-underline= ${colors.primary}
label-focused-padding = 2

label-occupied = %index%
label-occupied-padding = 2

label-urgent = %index%!
label-urgent-background = ${colors.alert}
label-urgent-padding = 2

label-empty = %index%
label-empty-foreground = ${colors.foreground-alt}
label-empty-padding = 2

[module/i3]
type = internal/i3
format = <label-state> <label-mode>
index-sort = true
wrapping-scroll = false

; Only show workspaces on the same output as the bar
;pin-workspaces = true

label-mode-padding = 2
label-mode-foreground = #000
label-mode-background = ${colors.primary}

; focused = Active workspace on focused monitor
label-focused = %index%
;label-focused-background = #555
label-focused-background = #ffffff
label-focused-underline = #ffffff
label-focused-padding = 6
label-focused-prefix ="A"
label-focused-foreground= #000
;label-focused-padding = ${module/bspwm.label-focused-padding}

; unfocused = Inactive workspace on any monitor
label-unfocused = %index%
label-unfocused-padding = ${module/bspwm.label-occupied-padding}

; visible = Active workspace on unfocused monitor
label-visible = %index%
label-visible-background = ${self.label-focused-background}
label-visible-underline = ${self.label-focused-underline}
label-visible-padding = ${self.label-focused-padding}

; urgent = Workspace with urgency hint set
label-urgent = %index%
label-urgent-background = ${module/bspwm.label-urgent-background}
label-urgent-padding = ${module/bspwm.label-urgent-padding}

[module/mpd]
type = internal/mpd
format-online = <label-song>  <icon-prev> <icon-stop> <toggle> <icon-next>

icon-prev = 
icon-stop = 
icon-play = 
icon-pause = 
icon-next = 

label-song-maxlen = 25
label-song-ellipsis = true

[module/xbacklight]
type = internal/xbacklight

format = <label> <bar>
label = BL

bar-width = 10
bar-indicator = |
bar-indicator-foreground = #ff
bar-indicator-font = 2
bar-fill = ─
bar-fill-font = 2
bar-fill-foreground = #9f78e1
bar-empty = ─
bar-empty-font = 2
bar-empty-foreground = ${colors.foreground-alt}

[module/backlight-acpi]
inherit = module/xbacklight
type = internal/backlight
card = intel_backlight

[module/cpu]
type = internal/cpu
interval = 2
format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #f90000
format-background = #f90000
format-padding = 2
label = %percentage:2%%

[module/memory]
type = internal/memory
interval = 2
format-prefix = " "
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #6153CC
format-background = #6153CC
format-padding = 2
label = %percentage_used%%

[module/wlan]
type = internal/network
interface = net1
interval = 3.0

format-connected = <ramp-signal> <label-connected>
format-connected-underline = #9f78e1
format-connected-background = #9f78e1
label-connected = %essid%

format-disconnected =
;format-disconnected = <label-disconnected>
;format-disconnected-underline = ${self.format-connected-underline}
;label-disconnected = %ifname% disconnected
;label-disconnected-foreground = ${colors.foreground-alt}

ramp-signal-0 = 
ramp-signal-1 = 
ramp-signal-2 = 
ramp-signal-3 = 
ramp-signal-4 = 
ramp-signal-foreground = ${colors.foreground-alt}

[module/eth]
type = internal/network
interface = eth0
interval = 3.0

format-connected-background = #55aa55
format-connected-underline = #55aa55
format-connected-padding = 2
format-connected-prefix = " "
format-connected-prefix-foreground = ${colors.foreground-alt}
label-connected = %local_ip%

format-disconnected =
;format-disconnected = <label-disconnected>
;format-disconnected-underline = ${self.format-connected-underline}
;label-disconnected = %ifname% disconnected
;label-disconnected-foreground = ${colors.foreground-alt}

[module/date]
type = internal/date
interval = 5

date =
date-alt = " %Y-%m-%d"

time = %H:%M
time-alt = %H:%M:%S

format-prefix = 
format-prefix-foreground = ${colors.foreground-alt}
format-underline = #0a6cf5
format-background = #0a6cf5
format-padding=2
;label-mode-background = #0a6cf5
label = %date% %time%

[module/volume]
type = internal/volume

format-volume = <label-volume> <bar-volume>
label-volume = VOL
label-volume-foreground = ${root.foreground}

format-muted-prefix = " "
format-muted-foreground = ${colors.foreground-alt}
label-muted = sound muted

bar-volume-width = 10
bar-volume-foreground-0 = #55aa55
bar-volume-foreground-1 = #55aa55
bar-volume-foreground-2 = #55aa55
bar-volume-foreground-3 = #55aa55
bar-volume-foreground-4 = #55aa55
bar-volume-foreground-5 = #f5a70a
bar-volume-foreground-6 = #ff5555
bar-volume-gradient = false
bar-volume-indicator = |
bar-volume-indicator-font = 2
bar-volume-fill = ─
bar-volume-fill-font = 2
bar-volume-empty = ─
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground-alt}

[module/battery]
type = internal/battery
battery = BAT0
adapter = AC
full-at = 98

format-charging = <animation-charging> <label-charging>
format-charging-underline = #A60067
format-charging-padding = 2
format-discharging = <ramp-capacity> <label-discharging>
format-discharging-underline = ${self.format-charging-underline}

format-full-prefix = " "
format-full-prefix-foreground = ${colors.foreground-alt}
format-full-underline = ${self.format-charging-underline}
format-charging-background = #A60067

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-foreground = ${colors.foreground-alt}

animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-foreground = ${colors.foreground-alt}
animation-charging-framerate = 750

[module/temperature]
type = internal/temperature
thermal-zone = 0
warn-temperature = 60

format = <ramp> <label>
format-underline = #f50a4d
format-padding = 2
format-background = #f50a4d
format-warn = <ramp> <label-warn>
format-warn-underline = ${self.format-underline}

label = %temperature%
label-warn = %temperature%
label-warn-foreground = ${colors.secondary}

ramp-0 = 
ramp-1 = 
ramp-2 = 
ramp-foreground = ${colors.foreground-alt}

[module/powermenu]
type = custom/menu

expand-right = true

format-spacing = 1

label-open = 
label-open-foreground = #ffffff
label-open-backgound = #ffffff
label-close =  cancel
label-close-foreground = ${colors.secondary}
label-separator = |
label-separator-foreground = ${colors.foreground-alt}

menu-0-0 = reboot
menu-0-0-exec = menu-open-1
menu-0-1 = power off
menu-0-1-exec = menu-open-2

menu-1-0 = cancel
menu-1-0-exec = menu-open-0
menu-1-1 = reboot
menu-1-1-exec = sudo reboot

menu-2-0 = power off
menu-2-0-exec = sudo poweroff
menu-2-1 = cancel
menu-2-1-exec = menu-open-0

[settings]
screenchange-reload = true
;compositing-background = xor
;compositing-background = screen
;compositing-foreground = source
;compositing-border = over

[global/wm]
margin-top = 0
margin-bottom = 0

; vim:ft=dosini

EOF
echo polybar conf suceed

##########################
# FILE polybar/launch.sh #
##########################
ls  ~/$config_ress/.config/polybar/

cat <<"EOF" >~/$config_ress/.config/polybar/launch.sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
polybar example &

echo "Bars launched..."

killall -q compton
#compton -c -r 4 -l -2 -t -4 -G -f -b
compton -f
#feh --bg-scale ~root/wall/213493.png 

#xrdb ~/.Xresources

#wal -i ~/.wallpapers/wolf.jpg

EOF
chmod +x ~/$config_ress/.config/polybar/launch.sh
echo launch succed
########## 
# Ranger #
##########

mkdir -p ~/$config_ress/.config/ranger
#> ~/$config_ress/.config/ranger/rc.conf
#> ~/$config_ress/.config/ranger/scope.sh

	#######################
	# FILE ranger/rc.conf #
	#######################


cat <<"EOF" >~/$config_ress/.config/ranger/rc.conf

set preview_images true
set ranger_load_default_rc false
EOF
 
########################
# FILE ranger/scope.sh #
########################
cat <<"EOF" >~/$config_ress/.config/ranger/scope.sh
#!/usr/bin/env sh
# ranger supports enhanced previews.  If the option "use_preview_script"
# is set to True and this file exists, this script will be called and its
# output is displayed in ranger.  ANSI color codes are supported.

# NOTES: This script is considered a configuration file.  If you upgrade
# ranger, it will be left untouched. (You must update it yourself.)
# Also, ranger disables STDIN here, so interactive scripts won't work properly

# Meanings of exit codes:
# code | meaning    | action of ranger
# -----+------------+-------------------------------------------
# 0    | success    | success. display stdout as preview
# 1    | no preview | failure. display no preview at all
# 2    | plain text | display the plain content of the file
# 3    | fix width  | success. Don't reload when width changes
# 4    | fix height | success. Don't reload when height changes
# 5    | fix both   | success. Don't ever reload
# 6    | image      | success. display the image $cached points to as an image preview
# 7    | image      | success. display the file directly as an image

# Meaningful aliases for arguments:
path="$1"            # Full path of the selected file
width="$2"           # Width of the preview pane (number of fitting characters)
height="$3"          # Height of the preview pane (number of fitting characters)
cached="$4"          # Path that should be used to cache image previews
preview_images="$5"  # "True" if image previews are enabled, "False" otherwise.

maxln=200    # Stop after $maxln lines.  Can be used like ls | head -n $maxln

# Find out something about the file:
mimetype=$(file --mime-type -Lb "$path")
extension=$(/bin/echo "${path##*.}" | awk '{print tolower($0)}')

# Functions:
# runs a command and saves its output into $output.  Useful if you need
# the return value AND want to use the output in a pipe
try() { output=$(eval '"$@"'); }

# writes the output of the previously used "try" command
dump() { /bin/echo "$output"; }

# a common post-processing function used after most commands
trim() { head -n "$maxln"; }

# wraps highlight to treat exit code 141 (killed by SIGPIPE) as success
safepipe() { "$@"; test $? = 0 -o $? = 141; }

# Image previews, if enabled in ranger.
if [ "$preview_images" = "True" ]; then
    case "$mimetype" in
        # Image previews for SVG files, disabled by default.
        ###image/svg+xml)
        ###   convert "$path" "$cached" && exit 6 || exit 1;;
        # Image previews for image files. w3mimgdisplay will be called for all
        # image files (unless overriden as above), but might fail for
        # unsupported types.
        image/*)
            exit 7;;
        # Image preview for video, disabled by default.:
        ###video/*)
        ###    ffmpegthumbnailer -i "$path" -o "$cached" -s 0 && exit 6 || exit 1;;
    esac
fi

case "$extension" in
    # Archive extensions:
    a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
    rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
        try als "$path" && { dump | trim; exit 0; }
        try acat "$path" && { dump | trim; exit 3; }
        try bsdtar -lf "$path" && { dump | trim; exit 0; }
        exit 1;;
    rar)
        # avoid password prompt by providing empty password
        try unrar -p- lt "$path" && { dump | trim; exit 0; } || exit 1;;
    7z)
        # avoid password prompt by providing empty password
        try 7z -p l "$path" && { dump | trim; exit 0; } || exit 1;;
    # PDF documents:
    pdf)
        try pdftotext -l 10 -nopgbrk -q "$path" - && \
            { dump | trim | fmt -s -w $width; exit 0; } || exit 1;;
    # BitTorrent Files
    torrent)
        try transmission-show "$path" && { dump | trim; exit 5; } || exit 1;;
    # ODT Files
    odt|ods|odp|sxw)
        try odt2txt "$path" && { dump | trim; exit 5; } || exit 1;;
    # HTML Pages:
    htm|html|xhtml)
        try w3m    -dump "$path" && { dump | trim | fmt -s -w $width; exit 4; }
        try lynx   -dump "$path" && { dump | trim | fmt -s -w $width; exit 4; }
        try elinks -dump "$path" && { dump | trim | fmt -s -w $width; exit 4; }
        ;; # fall back to highlight/cat if the text browsers fail
esac

case "$mimetype" in
    # Syntax highlight for text files:
    text/* | */xml)
        if [ "$(tput colors)" -ge 256 ]; then
            pygmentize_format=terminal256
            highlight_format=xterm256
        else
            pygmentize_format=terminal
            highlight_format=ansi
        fi
        try safepipe highlight --out-format=${highlight_format} "$path" && { dump | trim; exit 5; }
        try safepipe pygmentize -f ${pygmentize_format} "$path" && { dump | trim; exit 5; }
        exit 2;;
    # Ascii-previews of images:
    image/*)
        img2txt --gamma=0.6 --width="$width" "$path" && exit 4 || exit 1;;
    # Display information about media files:
    video/* | audio/*)
        exiftool "$path" && exit 5
        # Use sed to remove spaces so the output fits into the narrow window
        try mediainfo "$path" && { dump | trim | sed 's/  \+:/: /;';  exit 5; } || exit 1;;
esac

exit 1
EOF
 
chmod +x ~/$config_ress/.config/ranger/scope.sh 
cp -r ~/$config_ress/.* ~/


#####################################################################################################################









