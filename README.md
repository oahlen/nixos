# NixOS

## Resources
* [Nix packages](https://search.nixos.org/packages)
* [Wiki](https://nixos.wiki/)
* [Home-manager manual](https://nix-community.github.io/home-manager/)
* [Home-manager options](https://nix-community.github.io/home-manager/options.html)

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

### Install NixOS

```bash
cd /mnt
sudo nixos-install
```

## Common commands

* Build a new generation: `nixos-rebuild switch --use-remote-sudo --flake .`
* Build a new generation with a specified hostname: `nixos-rebuild switch --use-remote-sudo --flake .#HOSTNAME`
* Build a new generation and activate on next reboot `nixos-rebuild boot --use-remote-sudo --flake`
* Update flake lock file: `nix flake update`
* List system generations: `sudo nix-env --list-generations --profile /nix/var/nix/profiles/system`
* Delete generations older than 7 days: `sudo nix-collect-garbage --delete-older-than 7d`
* Show nix store roots: `nix-store --gc --print-roots`

## Development shells with direnv

To use with direnv run the follow commands:

```bash
echo "use flake github:oahlen/nixos#{SHELL}" >> .envrc
direnv allow
```
