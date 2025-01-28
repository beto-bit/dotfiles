# Arch
Instalar Arch. Script de referencia aquí: `scripts/archinstall.sh`


## Stow
```pacman -S stow```


## SSH + Git
```pacman -S openssh git```


## SSH
Generar claves
```ssh-keygen -t ed25519 -C "76757367+beto-bit@users.noreply.github.com"```

Añadir clave SSH a `ssh-agent`
```eval "$(ssh-agent -s)" && ssh-add ~/.ssh/beto```

Luego Hacer la cosa de GH. También se pueden crear claves para la otra cuenta.


## Git
Instalar [delta](https://github.com/dandavison/delta)
```pacman -S git-delta```


## yay
Instalar
```
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

Primer uso
```yay -Y --gendb```
```yay -Syu --devel```
```yay -Y --devel --save```


## Vim
`pacman -S vim`

Instalar Plug
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Correr `:PlugInstall` dentro de `vim`


## Tmux
```pacman -S tmux```


## zsh + Oh My Zsh
```pacman -S zsh```

**Oh My Zsh**
```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```

**Fzf Tab**
```git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab```

**Fzf Autosuggestions**
```git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions```


## Firewall
```sudo pacman -S ufw```

```sudo ufw enable```



## Nvim
Clonar mi repo al folder indicado
```git clone -b revamp git@github.com:beto-bit/nvim-config.git .config/nvim```


## Login
Install
```sudo pacman -S greetd greetd-tuigreet```

Enable
```sudo systemctl enable greetd.service```


## Fonts
```
sudo pacman -S \
    ttf-ms-win11-auto \
    ttf-cascadia-code \
    ttf-fira-code ttf-hack \
    ttf-jetbrains-mono-nerd \
    adobe-source-sans-pro-fonts \
    ttf-ubuntu-font-family
```


## Terminal
```sudo pacman -S kitty```


## CLI Utils
```
sudo pacman -S \
    wl-clipboard \
    grep ripgrep \
    eza \
    batcat batextras \
    fd \
    btop \
    7zip \
    cliphist \
    dog \
    ffmpeg \
    jq \
    fzf \
    nmap \
    sed \
    wget \
    xdg-utils \
    slurp grim \
```


## Programming Utils
```
sudo pacman -S \
    gcc clang nasm \
    make cmake meson \
    
```


## Audio
```
sudo pacman -S \
    pavucontrol \
    pipewire pipewire-pulse \
    wireplumber \
    whisper # audio recording \
    # amixer
```


## Brillo
```
sudo pacman -S brightnessctl
```


**Rust**
```curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh```

Instalar Nightly
```rustup toolchain install nightly```


**Nvm**
```curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash```


**Pyenv**
```curl -fsSL https://pyenv.run | bash```


## XDG Folders
```sudo pacman -S xdg-user-dirs```
```xdg-user-dirs-update```


## Desktop Utils
```
sudo pacman -S \
    labplot \
    vlc mpv \
    libreoffice-fresh \
    obs-studio \
    obsidian \
    imv \
    oculante \
    dot-matrix
    # inkscape \
    silicon # code to image \
```


## Funny Desktop Things
```
sudo pacman -S \
    vbam-wx
```


## Firefox
```sudo pacman -S firefox```

Instalar [Betterfox](https://github.com/yokoffing/Betterfox?tab=readme-ov-file)


## [Labwc](https://github.com/labwc/labwc)
Pendiente


## [Cage](https://github.com/cage-kiosk/cage)
Pendiente


## Hyprland
**Foreplay**
```
sudo pacman -S \
    mako \
    polkit polkit-gnome
```

**jaiperlan**
```
sudo pacman -S \
    hyprland \
    hypridle \
    hyprcursor \
    hyprpaper \
    hyprlang \
    hyprpicker \
    # hyprland-qt-support \
    # hyprland-qtutils \
    xdg-desktop-portal-hyprland
```


**Loox**
```
sudo pacman -S \
    nwg-look
```


**Menu Rofi**
```sudo pacman -S rofi-wayland```

Generar configuración
```mkdir -p ~/.config/rofi && rofi -dump-config > ~/.config/rofi/config.rasi```




## Optional
`pacseek` - Pacman TUI

Desactivar el delay de GRUB en `/etc/default/grub` con `GRUB_TIMEOUT_STYLE=hidden`


### SSD Optimization
Revisar si hay soporte con `lsblk --discard`. Está soportado si hay valores no nulos.

Instalar `util-linux`

Habilitar el servicio `fstrim.service` y `fstrim.timer`. El tiempo por defecto es cada semana.

