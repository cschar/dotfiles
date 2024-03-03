{...}:
{
  home.file = {
    ".gitconfig.default".source = ../config/git/.gitconfig;
  };

  #https://github.com/nix-community/home-manager/blob/master/modules/programs/git.nix
  programs.git = {
    enable = true;

    lfs.enable = true;
    difftastic.enable = false;
    diff-so-fancy.enable = true;
  };
}