# Teclas
loadkeys la-latin1

# Fuente
# setfont ?

# Verificación
cat /sys/firmware/efi/fw_platform_size

# Internet preinstall
iwctl
device list
station wlan0 scan
station wlan0 get-networks
station wlan0 connect "my-wifi"
ping archlinux.org

# Hora presinstall
timedatectl


# Partición
fdisk -l

# Referencia
# /boot/efi -   /dev/sda1 - 260M
# [SWAP] -      /dev/sda2 - 4GB
# / -           /dev/sda3 - ...GB

# Formatear particiones
mkfs.fat -F 32 /dev/sda1
mkfs.ext4 /dev/sda3
mkswap /dev/sda2

# Montar los drives
mount /dev/sda3 /mnt
mount --mkdir /dev/sda1 /mnt/boot/efi
swapon /dev/sda2


# Instalación
vim /etc/pacman.conf
# Parallel = 5

# Cambiar mirrors
pacman -Syy # Sync
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak # Backup
reflector -c "GU?" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

pacstrap -K /mnt base linux linux-firmware intel-ucode git sudo vim


# Configurar el sistema e iniciar
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt


# Tiempo
ln -sf /usr/share/zoneinfo/**Region/**City /etc/localtime
hwclock --systohc

# Zona horaria
timedatectl list-timezones
timedatectl set-timezone "GU?"


# Locale
vim /etc/locale.gen
# en_US.UTF-8 UTF-8
# en_US ISO-8859-1
# es_GT.UTF-8 UTF-8
# es_GT ISO-8859-1

vim /etc/locale.conf
# LANG=en_US.UTF-8

locale-gen

# KB Layout
vim /etc/vconsole.conf
# XKBLAYOUT = latam
# KEYMAP = la-latin1


# Network
vim /etc/hostname
# archy

vim /etc/hosts
# 127.0.0.1 localhost
# ::1       localhost
# 127.0.0.1 archy


# Initramfs
mkinitcpio -P


# Bootloader
pacman -S grub efibootmgr
mkdir /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg


# Root password
passwd


# User
useradd -m beto
passwd beto


# UNCOMMENT SHIT IN /etc/sudoers
# %wheel ALL=(ALL:ALL) ALL
EDITOR=nano visudo
usermod -aG wheel,audio,video,lp,input beto


# Wi-fi
pacman -S networkmanager dhcpd nmtu iwd
systemctl enable NetworkManager
# ? systemctl enable dhcpd


# Microcode
vim /etc/mkinitcio.conf
# Add microcode to HOOKS
# HOOKS = (base udev autodetect microcode modconf kms keyboard keymap consolefont numlock block filesystems fsck)


# Power
vim /etc/systemd/logind.conf
# HandlePower=ignore
# HandlePowerKeyLongPress=poweroff


# CpuPower
pacman -S cpupower # cpupower-gui
vim /etc/default/cpupower
# governor='ondemand'
# min_freq='800MHz'
# max_freq='2.6GHz'

systemctl enable cpupower


