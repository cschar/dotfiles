


```bash
s
# update wsl2
wsl --update

# download and import
# https://github.com/nix-community/NixOS-WSL

# list installed distributoins
wsl -l -v 

# to run nixos
wsl --distribution NixOS

# update
 sudo nix-channel --update
 sudo nixos-rebuild switch

# install git
nix-env --install git

# see all installed
nix-env --query

# install dotfiles
sudo nixos-rebuild switch --flake .
```