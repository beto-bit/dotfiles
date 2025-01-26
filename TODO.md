# Arch
Instalar Arch. Script de referencia aquí: `scripts/archinstall.sh`


# Stow
`pacman -S stow`


# SSH + Git
`pacman -S openssh git`

## SSH
Generar claves
`ssh-keygen -t ed25519 -C "76757367+beto-bit@users.noreply.github.com"`

Añadir clave SSH a `ssh-agent`
`eval "$(ssh-agent -s)"`
`ssh-add ~/.ssh/beto`

Luego Hacer la cosa de GH. También se pueden crear claves para la otra cuenta.


## Git
Instalar [delta](https://github.com/dandavison/delta)
`pacman -S git-delta`


## yay
Instalar
```
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

Primer uso
`yay -Y --gendb`
`yay -Syu --devel`
`yay -Y --devel --save`


## Vim
`pacman -S vim`

Instalar Plug
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

Correr `:PlugInstall` dentro de `vim`


## zsh + Oh My Zsh
`pacman -S zsh`

Oh My Zsh
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

Fzf Tab
`git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab`

Fzf Autosuggestions
`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`


