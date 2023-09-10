# Minimal_packages
My collection of programs compiled (using pacman package manager) customized by me.

The target of this is;
- Compile programs to be as minimal is possible.

I highly recommend use as primary compiler the MUSL standard library.

## Hardening

This are the hardening flags in the build temporal container used to built them;

```
#########################################################################
# ARCHITECTURE, COMPILE FLAGS
#########################################################################
#
CARCH="x86_64"
CHOST="x86_64-pc-linux-gnu"

#-- Compiler and Linker Flags
#CPPFLAGS=""
CFLAGS="-O2 -Wp,-D_FORTIFY_SOURCE=2 -fstack-clash-protection -fcf-protection -fstack-protector-strong -fuse-ld=mold"
CXXFLAGS="$CFLAGS -Wp,-D_GLIBCXX_ASSERTIONS"
LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now,-z,defs -fuse-ld=mold"
LTOFLAGS="-flto=auto"
RUSTFLAGS="-C opt-level=2 -C link-arg=-fuse-ld=mold -C strip=debuginfo -C strip=symbols -C debug-assertions=false"
#-- Make Flags: change this for DistCC/SMP systems
MAKEFLAGS="-j20"
#-- Debugging flags
#-- This options disable debug
DEBUG_CFLAGS="-g0"
DEBUG_CXXFLAGS="$DEBUG_CFLAGS"
DEBUG_RUSTFLAGS="-C debuginfo=0"
```

## Repository for Arch, Manjaro and others 

If you want add the repository to use with pacman package manager do;

1. Add this to /etc/pacman.conf;

```
[shyanjmc-minimal]
SigLevel = Required
Server = https://shyanjmc.com
```

Since 05-07-2023 all packages and databases are signed.

2. Then execute;

```
sudo pacman-key -u -r 260AF60D90A192057C42D4211A96C89A3A611399 --keyserver pgp.mit.edu
sudo pacman-key --lsign-key 260AF60D90A192057C42D4211A96C89A3A611399
sudo pacman -Syy
```

If you have problems with "pgp.mit.edu" change it to keyserver.ubuntu.com

## Github and gitlab
If you are seeing this in GitHub or GitLab take under consideration that are mirrors. The official repo is; 

- https://git.shyanjmc.com/minimal_packages/

## Contributions and support

For now I am the main and only dev in this project, maybe in the future I will allow collaborations. 

If you want support this project you can;

Join my patreon;

- https://patreon.com/shyanjmc

Donate me crypto;

- Bitcoin (BTC); 16n6GP4XkZiyoGCZei6uxdpohCkPm7eQ7L
- Ethereum (ETH); 0x27219354cC70dE84e7fae0B71E9e2605026b10B2
- DAI (ERC-20); 0x27219354cC70dE84e7fae0B71E9e2605026b10B2

Also you can donate trought crypto-coffee.xyz;

- https://crypto-coffee.xyz/donate/shyanjmc

And if you know me personally, let me know that you have donated, since that moment we will share a beer (or mead if you are man/women of honor).

