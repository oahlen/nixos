# NixOS

## Installation

### Connect to a wireless network

Enable and start wpa_supplicant:

```bash
sudo systemctl start wpa_supplicant
wpa_cli
```

Connect to a new wifi network

```bash
add_network
set_setwork 0 ssid "SSID"
set_setwork 0 psk "PASSWORD"
enable_network 0
```

### Partition disks (UEFI)

Run `sudo fdisk /dev/diskX`

* g (gpt disk label)
* n
* 1 (partition number [1/128])
* 2048 first sector
* +500M last sector (boot sector size)
* t
* 1 (EFI System)
* n
* 2
* default (fill up partition)
* default (fill up partition)
* w (write)

### Label partitions and create file systems

* lsblk
* sudo mkfs.fat -F 32 /dev/sdX1
* sudo fatlabel /dev/sdX1 NIXBOOT
* sudo mkfs.ext4 /dev/sdX2 -L NIXROOT
* sudo mount /dev/disk/by-label/NIXROOT /mnt
* sudo mkdir -p /mnt/boot
* sudo mount /dev/disk/by-label/NIXBOOT /mnt/boot

### Generate NixOS config

```bash
sudo nixos-generate-config --root /mnt
cd /mnt/etc/nixos/
sudo vim configuration.nix
```

### Update or edit configuration.nix

TODO

### Install NixOS

```bash
cd /mnt
sudo nixos-install
```

## Common commands

* Build a new generation: `doas nixos-rebuild switch --flake .`
* Build a new generation with a specified hostname: `doas nixos-rebuild switch --flake .#HOSTNAME`
* Update flake lock file: `nix flake update`
* Build a new generation and activate on next reboot `sudo nixos-rebuild boot --flake`
* List system generations: `sudo nix-env --list-generations --profile /nix/var/nix/profiles/system`
* Delete generations older than 7 days: `nix-collect-garbage --delete-older-than 7d`

## Development shells

Copy one of the shell config templates to your source repo and name it 'shell.nix'

### Nix direnv
To use with direnv run the follow commands:

```bash
echo "use nix" >> .envrc
direnv allow
```
