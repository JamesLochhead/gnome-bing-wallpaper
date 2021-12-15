install:
	chmod u+x systemd-timer.sh
	./systemd-timer.sh
uninstall:
	rm -rf "$HOME/.config/systemd/user/bing_wallpaper.timer"
	rm -rf "$HOME/.config/systemd/user/bing_wallpaper.service"
