
# https://github.com/nix-community/NixOS-WSL

{pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
  ];

  wsl = {
    enable = true;
    defaultUser = "nixos";
    nativeSystemd = true;
    interop.includePath = true;
    
  };

  environment = {
    systemPackages = with pkgs; [
      wslu

      flyctl
      cowsay
      
    ];
  };
}