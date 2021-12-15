# GNOME Bing Wallpaper

## Description

A simple Python script, with SystemD service/timer, that downloads the Bing
Wallpaper every day and sets it as the desktop background on GNOME 3.

Only symlinks are created outside the repository and link back to files within
the repostisory. Therefore, all changes can be tracked via Git.

## Installation

- Enable the user-specific SystemD as root:
```
loginctl enable-linger USERNAME
```

- Log out and/or restart.

- Create a directory you want to store the wallpapers in.

- Edit `bing_wallpaper.py`. Change the BACKGROUNDS_DIRECTORY variable value to
point to the directory you want to store the wallpapers in. Use the absolute
path.

- Run `make install`.

## Removal

- Run `make uninstall`.
