{ config, pkgs, lib, osConfig, ... }:
#
# home-manager nix file
# contains
# - home
# - programs

{

 # git is already installed on nixos manually
 # complains if it exists
 imports = if (osConfig.networking.hostName == "nixos")
    then [
      ./_nvim.nix
      ./_tmux.nix
    ]
    else [
      ./_git.nix
      ./_nvim.nix
      ./_tmux.nix
    ];


  home = {
    stateVersion = "23.05"; # Please read the comment before changing.
    
    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = [
      
      pkgs.azure-cli
      
      pkgs.wget
      pkgs.jq
      
      # pkgs.git
      pkgs.lazygit
      pkgs.starship

      # language servers
      pkgs.nixd # nix language server
      
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # git
      #".gitconfig.default".source = ../git/.gitconfig;

      # vim
      # ".config/nvim/.vimrc".source = ../nvim/.config/nvim/.vimrc;
      # wezterm
      # ".config/wezterm/wezterm.lua".source = ../wezterm/.wezterm.lua;

      # tmux
      # ".config/tmux/tmux.conf".source = ../tmux/tmux.conf;

      #random file
      # ".config/myfile/myfile.conf".source = ../tmux/tmux.conf;

      #starship
      ".config/starship.toml".source = ../config/starship/config.toml;
    };
  };


  # https://github.com/nix-community/home-manager/tree/master/modules/programs
  programs = {
    # # Use fish
    # fish = {
    #   enable = true;

    #   interactiveShellInit = ''
    #     set fish_greeting # N/A
    #   '';

    #   plugins = [
    #     {
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

    # starship = {
    #   enable = true;

    #   settings = {
    #     command_timeout = 100;
    #     format = "[$all](dimmed white)";

    #     character = {
    #       success_symbol = "[❯](dimmed green)";
    #       error_symbol = "[❯](dimmed red)";
    #     };

    #     git_status = {
    #       style = "bold yellow";
    #       format = "([$all_status$ahead_behind]($style) )";
    #     };

    #     jobs.disabled = true;
    #   };
    # };


  };
}
