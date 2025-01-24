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

