{ config, pkgs, lib, ... }:

{
  # allow terraform
  nixpkgs.config.allowUnfree = true;


  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.home-manager


      pkgs.vim
      pkgs.neovim

      pkgs.terraform
      pkgs.powershell

      pkgs.nixpkgs-fmt
    ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # programs.fish.enable = true;

  # the tmux builtin to nix-darwin, not the stand-alone tmux nix package
  programs.tmux = {
    enable = true;
    enableSensible = true;
    enableMouse = true;
    # sensibleOnTop = false;
    # prefix = "C-a";
    # escapeTime = 10;

    extraConfig = lib.fileContents ../tmux/tmux.conf;

    # plugins = with pkgs.tmuxPlugins; [
    #   fuzzback
    #   logging
    #   pain-control
    #   sessionist
    #   tmux-thumbs
    #   yank
    # ];
  };


  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";


  # Install fonts
  fonts.fontDir.enable = true;
  fonts.fonts = [
    pkgs.monaspace
    # https://github.com/yuru7/udev-gothic
    pkgs.udev-gothic-nf

    pkgs.recursive
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

  ];

  homebrew = {
    enable = true;

    casks = [
      "iterm2"
    ];


  };

  system.defaults = {

    ### this doesnt change locatoin?
    screencapture = {
      #location = "/users/cody/Pictures/scrnshot/";
      location = "/users/cody/Pictures/scrnshot2/";
    };

    # minimal dock
    dock = {
      autohide = false;
      orientation = "bottom";
      #orientation = "right";
      #orientation = "left";
      # show-process-indicators = false;
      # show-recents = false;
      # static-only = true;
    };
    # a finder that tells me what I want to know and lets me work
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
    };
    # Tab between form controls and F-row that behaves as F1-F12
    NSGlobalDomain = {
      # AppleKeyboardUIMode = 3;
      # "com.apple.keyboard.fnState" = true;
    };
  };
}
