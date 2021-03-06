#!/usr/bin/sh

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="~/.config/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown=" Выключить"
reboot="勒 Перезагрузить"
lock=" Заблокировать"
suspend="鈴 Спать"
logout=" Выйти"

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Ты уверен? : "\
		-theme $dir/confirm.rasi
}

# Message
msg() {
	rofi -theme "$dir/message.rasi" -e "ВСТАТЬ И ВЫЙТИ!!!"
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Время работы: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" || $ans == "д"|| $ans == "да" ]]; then
			systemctl poweroff
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" || $ans == "н"|| $ans == "нет" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $reboot)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" || $ans == "д"|| $ans == "да" ]]; then
			systemctl reboot
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" || $ans == "н"|| $ans == "нет" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $lock)
		if [[ -f /usr/bin/i3lock ]]; then
			i3lock
		elif [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l
		fi
        ;;
    $suspend)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" || $ans == "д" || $ans == "да" ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" || $ans == "н" || $ans == "нет" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $logout)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" || $ans == "д" || $ans == "да" ]]; then
			if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
				i3-msg exit
			fi
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" || $ans == "н" || $ans == "нет" ]]; then
			exit 0
        else
			msg
        fi
        ;;
esac
