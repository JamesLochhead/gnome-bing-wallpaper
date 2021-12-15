#!/usr/bin/env bash

# Enable user-specific systemd as root:
# loginctl enable-linger USERNAME
# User needs to log off and on again to enable the user of systemctl

repo_location=$(dirname "$(readlink -f "$0")")
user_systemd_folder="$HOME/.config/systemd/user/"
bing_wallpaper_timer_path="$user_systemd_folder/bing_wallpaper.timer"
bing_wallpaper_service_path="$user_systemd_folder/bing_wallpaper.service"
bing_wallpaper_service_repo="$repo_location/bing_wallpaper.service"

mkdir -p "$user_systemd_folder"

cat > $bing_wallpaper_service_repo <<EOF
[Unit]
Description=Run BingWallpaper.py

[Service]
ExecStart=$repo_location/bing_wallpaper.py

[Install]
WantedBy=multi-user.target
EOF

ln -sf "$bing_wallpaper_service_repo" "$bing_wallpaper_service_path"
ln -sf "$repo_location/bing_wallpaper.timer" "$bing_wallpaper_timer_path"

chmod u+x "$repo_location/bing_wallpaper.py"
systemctl --user enable --now bing_wallpaper.service
systemctl --user enable --now bing_wallpaper.timer
