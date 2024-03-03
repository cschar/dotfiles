# nixpkgs import used for
# nixpkgs.config.allowUnfreePredicate = pkg:

{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixos-wsl, flake-utils, nixpkgs, ... }: {

    nixosConfigurations = {
      "nixos" = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-wsl.nixosModules.wsl
          ./nixos/configuration.nix
          ./config/wsl
          home-manager.nixosModules.home-manager
          {
            home-manager.users.nixos = import ./home/home.nix;
          }
        ];
      };
    };

    darwinConfigurations = {


      # "A_MAC_COMPUTER" = nix-darwin.lib.darwinSystem {
      #   system = "aarch64-darwin";
      #   modules = [
      #     ./darwin.nix
      #     home-manager.darwinModules.home-manager
      #     {
      #       home-manager = {
      #         users.etravers = import ../home-manager/home.nix;
      #       };
      #       users.users.etravers.home = "/Users/etravers";
      #     }
      #   ];
      #   specialArgs = { inherit inputs; };
      # };

      "cmba" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [

          ./darwin.nix

          home-manager.darwinModules.home-manager
          {
            home-manager = {
              users.cody = import ../home-manager/home.nix;
            };
            users.users.cody.home = "/Users/cody";
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
