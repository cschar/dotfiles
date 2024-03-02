# nixpkgs import used for
# nixpkgs.config.allowUnfreePredicate = pkg:

{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }: {
    darwinConfigurations = {
      "A_MAC_COMPUTER" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              users.etravers = import ../home-manager/home.nix;
            };
            users.users.etravers.home = "/Users/etravers";
          }
        ];
        specialArgs = { inherit inputs; };
      };

      "cmba" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          
          ./darwin.nix

          # home-manager.darwinModules.home-manager
          # {
          #   home-manager = {
          #     users.evan = import ../home-manager/home.nix;
          #   };
          #   users.users.evan.home = "/Users/evan";
          # }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };

  # outputs = inputs@{ self, nix-darwin, nixpkgs }:
  # let
  #   configuration = { pkgs, lib,  ... }: {


  #     # Use a custom configuration.nix location.
  #     # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  #     # # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  #     # darwin-rebuild switch --flake $HOME/Development/repository/github.com/cschar/dotfiles/my-nix-darwin
  #     environment.darwinConfig = "$HOME/Development/repository/github.com/cschar/dotfiles/my-nix-darwin";

  #     # allow terraform
  #     nixpkgs.config.allowUnfree = true;


  #     # List packages installed in system profile. To search by name, run:
  #     # $ nix-env -qaP | grep wget
  #     environment.systemPackages =
  #       [
  #         pkgs.vim
  #         pkgs.neovim

  #         pkgs.terraform
  #         pkgs.powershell

  #         pkgs.nixpkgs-fmt
  #       ];

  #     # Auto upgrade nix package and the daemon service.
  #     services.nix-daemon.enable = true;
  #     # nix.package = pkgs.nix;

  #     # Necessary for using flakes on this system.
  #     nix.settings.experimental-features = "nix-command flakes";

  #     # Create /etc/zshrc that loads the nix-darwin environment.
  #     programs.zsh.enable = true;  # default shell on catalina
  #     # programs.fish.enable = true;

  #     # the tmux builtin to nix-darwin, not the stand-alone tmux nix package
  #     programs.tmux = {
  #       enable = true;
  #       enableSensible = true;
  #       enableMouse = true;
  #       # sensibleOnTop = false;
  #       # prefix = "C-a";
  #       # escapeTime = 10;
  #       # terminal = "wezterm";

  #       # extraConfig = lib.fileContents /users/cody/.tmux.conf;
  #       extraConfig = lib.fileContents ../tmux/tmux.conf;

  #       # plugins = with pkgs.tmuxPlugins; [
  #       #   fuzzback
  #       #   logging
  #       #   pain-control
  #       #   sessionist
  #       #   tmux-thumbs
  #       #   yank
  #       # ];
  #     };

  #     # Set Git commit hash for darwin-version.
  #     system.configurationRevision = self.rev or self.dirtyRev or null;

  #     # Used for backwards compatibility, please read the changelog before changing.
  #     # $ darwin-rebuild changelog
  #     system.stateVersion = 4;

  #     # The platform the configuration will be used on.
  #     nixpkgs.hostPlatform = "aarch64-darwin";

  #       # Install fonts
  #   fonts.fontDir.enable = true;
  #   fonts.fonts = [
  #     pkgs.monaspace
  #     # https://github.com/yuru7/udev-gothic
  #     pkgs.udev-gothic-nf

  #     pkgs.recursive
  #     (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

  #   ];

  #   # https://github.com/LnL7/nix-darwin/blob/master/modules/homebrew.nix#L533
  #   # homebrew doesnt install homebrew, it just uses it
  #   homebrew = {
  #     enable = true;

  #     casks = [
  #       # "1password"
  #       "iterm2"
  #     ];
  #   };

  #   system.defaults = {

  #     ### this doesnt change locatoin?
  #     screencapture = {
  #         #location = "/users/cody/Pictures/scrnshot/";
  #         location = "/users/cody/Pictures/scrnshot2/";
  #     };

  #     # minimal dock
  #     dock = {
  #         autohide = false;
  #         orientation = "bottom";
  #         #orientation = "right";
  #         #orientation = "left";
  #         # show-process-indicators = false;
  #         # show-recents = false;
  #         # static-only = true;
  #     };
  #     # a finder that tells me what I want to know and lets me work
  #     finder = {
  #       AppleShowAllExtensions = true;
  #       ShowPathbar = true;
  #       FXEnableExtensionChangeWarning = false;
  #     };
  #     # Tab between form controls and F-row that behaves as F1-F12
  #     NSGlobalDomain = {
  #       # AppleKeyboardUIMode = 3;
  #       # "com.apple.keyboard.fnState" = true;
  #     };
  #   };
  # };
  # in
  # {
  #   # Build darwin flake using:
  #   # $ darwin-rebuild build --flake .#simple
  #   darwinConfigurations."cmba" = nix-darwin.lib.darwinSystem {
  #     modules = [ configuration ];
  #   };

  #   # Expose the package set, including overlays, for convenience.
  #   darwinPackages = self.darwinConfigurations."cmba".pkgs;
  # };
}
