{ pkgs, lib, ... }:
{
  programs.tmux = {
    enable = true;

    extraConfig = lib.fileContents ../config/tmux/tmux.conf;


    plugins = with pkgs.tmuxPlugins; [
      
      #   fuzzback
      #   logging
      #   pain-control
      #   sessionist
      tmux-thumbs
      #   yank
      
      #==== themes ====
      gruvbox
      # nord

    ];
  };
}
