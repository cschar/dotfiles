{ config, pkgs, lib, ... }:
#
# home-manager nix file
# contains
# - home
# - programs

{
  home = {
    stateVersion = "23.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = [
      # pkgs.nixd # nix language server
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # git
      # ".cvsignore".source = ../git/.cvsignore;
      # ".gitconfig".source = ../git/.gitconfig;
      # vim
      # ".config/nvim/.vimrc".source = ../nvim/.config/nvim/.vimrc;
      # wezterm
      # ".config/wezterm/wezterm.lua".source = ../wezterm/.wezterm.lua;

      # tmux
      # ".config/tmux/tmux.conf".source = ../tmux/tmux.conf;

      #random file
      ".config/myfile/myfile.conf".source = ../tmux/tmux.conf;
    };
  };

  programs = {
    # # Use fish
    # fish = {
    #   enable = true;

    #   interactiveShellInit = ''
    #     set fish_greeting # N/A
    #   '';

    #   plugins = [
    #     {
    #       # TODO: Remove this
    #       name = "fish-asdf";
    #       src = pkgs.fetchFromGitHub {
    #         owner = "rstacruz";
    #         repo = "fish-asdf";
    #         rev = "5869c1b1ecfba63f461abd8f98cb21faf337d004";
    #         sha256 = "39L6UDslgIEymFsQY8klV/aluU971twRUymzRL17+6c=";
    #       };
    #     }
    #     {
    #       name = "nix-env";
    #       src = pkgs.fetchFromGitHub {
    #         owner = "lilyball";
    #         repo = "nix-env.fish";
    #         rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
    #         hash = "sha256-RG/0rfhgq6aEKNZ0XwIqOaZ6K5S4+/Y5EEMnIdtfPhk=";
    #       };
    #     }
    #   ];
    # };

    direnv = {
      enable = true;

      nix-direnv.enable = true;
    };

    starship = {
      enable = true;

      settings = {
        command_timeout = 100;
        format = "[$all](dimmed white)";

        character = {
          success_symbol = "[❯](dimmed green)";
          error_symbol = "[❯](dimmed red)";
        };

        git_status = {
          style = "bold yellow";
          format = "([$all_status$ahead_behind]($style) )";
        };

        jobs.disabled = true;
      };
    };

    git = {
      enable = true;

      lfs.enable = true;
    };

    # jujutsu = {
    #   enable = true;
    #   enableFishIntegration = true;
    # };

    # tmux = {
    #   enable = true;
    #   sensibleOnTop = false;
    #   prefix = "C-a";
    #   # prefix = "C-space";
    #   escapeTime = 10;
    #   shell = "${pkgs.fish}/bin/fish";
    #   terminal = "wezterm";

    #   extraConfig = lib.fileContents ../tmux/.config/tmux/tmux.conf;

    #   plugins = with pkgs.tmuxPlugins; [
    #     fuzzback
    #     logging
    #     pain-control
    #     sessionist
    #     tmux-thumbs
    #     yank
    #   ];
    # };


  };
}