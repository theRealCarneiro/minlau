# Minlau
Minimalist wine game launcher written purely in bash.


## Features
 - Fully featured zsh completion script
 - Create and delete wine prefixes
 - Download and install wine builds
 - Download and install dxvk builds
 - Install and uninstall dxvk on wine prefix
 - Launch games
 - Use feral gamemode
 - Configure everything with a config file


## Available commands

| Command                   | Description                                       |
| -----------------------   | ------------------------------------------------- |
| --list-games              | List games in config.ini                          |
| --help                    | Display help message                              |
| --create-prefix [game]    | Create a prefix if there isn't already one        |
| --delete-prefix [game]    | Delete a prefix                                   |
| --launch [game]           | Launch game                                       |
| --install-dxvk [game]     | Install dxvk on prefix                            |
| --uninstall-dxvk [game]   | Uninstall dxvk on prefix                          |
| --winecfg   [game]        | Open winecfg on prefix                            |
| --winetricks   [game]     | Open winetricks on prefix                         |
| --download-wine [version] | Download wine build and install it                |
| --download-dxvk [version] | Download dxvk build and install it                |
| --clear-cache             | Delete everythong in the cache directory          |


## Config file

The config file is located at `$XDG_CONFIG_HOME/minlau/config.ini` or `$HOME/.config/minlau/config.ini` if `$XDG_CONFIG_HOME` is not set. It will accept any varible you set, so things like `DXVK_HUD` can also be used.

| Variable                | Description                                              |
| ----------------------- | -------------------------------------------------------- |
| [global]                | Global settings, will be overwriten by the game var      |
| [GAME]                  | Game specific settings, overwrites global settings       |
| LAUNCH                  | Path to game executable                                  |
| WINE                    | Path to wine binary                                      |
| WINEPREFIX              | Path to wine prefix                                      |
| WINEARCH                | Wine architecture [win32/win64], defaults to win64       |
| WINEESYNC               | Whether or not to use esync [0/1]                        |
| WINEFSYNC               | Whether or not to use fsync [0/1]                        |
| GAMEMODE                | Whether or not to use feral gamemode [0/1]               |
| WINE_INSTALL            | Path to install wine builds                              |
| DXVK_INSTALL            | Path to install dxvk builds                              |
| DXVK_PATH               | Path to dxvk installation                                |
| DXVK_DLLS               | Which dxvk dlls to install                               |
| AUTO_DXVK               | Whether or not to auto (un)install dxvk on prefix [0/1]  |
| DXVK                    | When AUTO_DXVK=1 it will install or uninstall dxvk [0/1] |
| ARGS                    | Argument to go after command                             |
| SANDBOX                 | Disable wine desktop integration [0/1]                   |
| WINETRICKS_SANDBOX      | Disable wine desktop integration using winetricks [0/1]  |
| MINLAU_CACHE            | Path to store temporary files                            |
| WORKING_DIR             | Directory to cd when opening the game                    |
| DISABLE_SCREEN_SAVER    | Disable X screen saver                                   |


Example `config.ini`:

```ini
[global]

# Wine
WINE="/usr/bin/wine"
WINEPREFIX="$XDG_DATA_HOME/wine"
WINE_INSTALL="$XDG_DATA_HOME/minlau/wine"
WINEARCH=win64
WINEESYNC=1
WINEFSYNC=1

# DXVK
DXVK_INSTALL="$XDG_DATA_HOME/minlau/dxvk/"
DXVK_PATH="$XDG_DATA_HOME/lutris/runtime/dxvk/v1.8.1L"
AUTO_DXVK=1
DXVK=1
DXVK_HUD=0

# Misc
GAMEMODE=1
MANGOHUD=0
SANDBOX=1 ;you can use this or the winetricks implementation, this one is faster
WINETRICKS_SANDBOX=0 
DISABLE_SCREEN_SAVER=1

; can comment with # or ;
[foo]
LAUNCH="$XDG_DATA_HOME/Games/foo/foo.exe" 
WINE="$XDG_DATA_HOME/lutris/runners/wine/lutris-6.4-x86_64/bin/wine64"
WINEPREFIX="$XDG_DATA_HOME/Games/wineprefixes/foo"
DXVK_DLLS='d3d9.dll d3d10core.dll d3d11.dll' #optional
DXVK_STATE_CACHE=1
DXVK_STATE_CACHE_PATH=$WINEPREFIX # can use variables declared BEFORE
```

## Installation
### Arch/Manjaro
A package is available in the AUR [minlau-git](https://aur.archlinux.org/packages/minlau-git/). If you use an AUR helper:
```sh
paru -S minlau-git
```

### Any distro
Clone the repo and modify the contents of setup.sh to fit your needs, then just run the install script:
```sh
git clone https://github.com/theRealCarneiro/minlau.git
cd minlau
chmod +x setup.sh
sudo ./setup.sh install
```
#### Uninstall
```sh
sudo ./setup.sh uninstall
```
