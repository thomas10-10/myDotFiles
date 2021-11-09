# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# Launch bar1 and bar2
polybar example &
echo "Bars launched..."
killall -q compton
compton -c -r 4 -l -4 -t -4 -G -f -b --inactive-dim=0.3
kill $(ps aux | grep 'back4' | awk '{print $2}')
feh --bg-scale /usr/local/share/blur-abstract-wa.jpg
#killall back4.sh
#back4.sh 0.02 /usr/local/src/foo-Wallpaper-Feh-Gif.git/gif/pixel.gif &
#compton -f
#feh --bg-scale ~root/wall/213493.png 
#xrdb ~/.Xresources
#wal -i ~/.wallpapers/wolf.jpg
