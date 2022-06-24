#!/bin/bash

## Joaquin 'ShyanJMC' Crespo <shyanjmc@protonmail.com>
## Script for customize arch's kernel configuration.

## Clean
rm -rf src/


## Get files
echo "Geting files."
curl -s -O https://raw.githubusercontent.com/archlinux/svntogit-packages/master/linux/repos/core-x86_64/PKGBUILD
curl -s -O https://raw.githubusercontent.com/archlinux/svntogit-packages/master/linux/repos/core-x86_64/config

## Customize files

echo "Customizing files."

### Changing pkg name to not replace Arch's default kernel
sed -i 's/pkgbase=linux/pkgbase=linux-shyanjmc/g' PKGBUILD
### Change default hostname
sed -i 's/KBUILD_BUILD_HOST=archlinux/KBUILD_BUILD_HOST=shyanjmc/g' PKGBUILD
### Disable html documents
sed -i 's/make\ htmldocs//g' PKGBUILD
### Disable sha256sum checksum for specific version
sed -i 's/ee1f138da9c39bc2510f25cd7bfc00edaa6e418b35e52ce7f8392135e51068b9/SKIP/' PKGBUILD
### Versions and hostname builtin kernel
sed -i 's/CONFIG_LOCALVERSION=\"\"/CONFIG_LOCALVERSION=shyanjmc-1/g' config
sed -i 's/CONFIG_DEFAULT_HOSTNAME=\"archlinux\"/CONFIG_DEFAULT_HOSTNAME=\"sleipnir\"/g' config

## GPG Keys
echo "Inporting GPG Keys"
### Linus Torvalds
gpg --receive-keys ABAF11C65A2970B130ABE3C479BE3E4300411886
### Greg Koah
gpg --receive-keys 647F28654894E3BD457199BE38DBBDC86092693E
### Jan Steffens
gpg --receive-keys A2FF3A36AAA56654109064AB19802F8B0D70FC30
### David Runge
gpg --receive-keys C7E7849466FE2358343588377258734B41C31549
### Jan Steffens
gpg --keyserver hkps://keys.openpgp.org --receive-key 3B94A80E50A477C7

## Change to native in makepkg.conf

echo "Changing makepkg.conf configurations. Will request root password."

su -c "sed -i 's/march=x86_64/march=native/g' /etc/makepkg.conf" 
su -c "sed -i 's/OPTIONS=(strip\ docs\ !libtool\ !staticlibs\ emptydirs\ zipman\ purge\ !debug\ !lto)/OPTIONS=(strip\ !docs\ !libtool\ !staticlibs\ emptydirs\ zipman\ purge\ !debug\ !lto)/g' /etc/makepkg.conf"

## Create package

echo "Creating package"
sleep 1
makepkg -s
