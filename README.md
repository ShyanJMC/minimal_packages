# Minimal_packages
My collection of programs compiled (using pacman package manager) customized by me.

The target of this is;
- Compile programs to be as minimal is possible.

I highly recommend use as primary compiler the MUSL standard library.

## Repository for Arch, Manjaro and others 

If you want add the repository to use with pacman package manager do;

1. Add this to /etc/pacman.conf;

```
[shyanjmc-minimal]
SigLevel = Required DatabaseOptional
Server = https://shyanjmc.com
```

If you have issues with package's signature replace "DatabaseOptional" with "PackageOptional" in above. As each package must be signed maybe that one have not signature yet.

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

