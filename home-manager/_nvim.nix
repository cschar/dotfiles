{lib, pkgs, ...}:
{
  home.file.".config/nvim/.vimrc".source = ../config/nvim/.config/nvim/.vimrc;


  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraLuaConfig = lib.fileContents ../config/nvim/.config/nvim/init.lua;

    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      nvim-web-devicons
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          require'nvim-treesitter.configs'.setup {
            highlight = { enable = true, },
            indent = { enable = true },
          }
        '';
      }
    ];
  };
}