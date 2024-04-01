{ pkgs, lib, ... }:
{
  imports = [
    ./lsp.nix
    ./theme.nix
    ./ddc.nix
  ];
  programs.nixvim = {
    enable = true;

    options = {
      number = true;
      relativenumber = true;
    };

    plugins.nvim-tree = {
      enable = true;
      openOnSetup = true;
      autoReloadOnWrite = true;
    };

    plugins = {
      treesitter = {
        enable = true;
        indent = true;
      };
      treesitter-context.enable = true;
      rainbow-delimiters.enable = true;
    };
    
    plugins.nvim-autopairs.enable = true;
    plugins.copilot-vim.enable = true;
    plugins.indent-blankline = {
        enable = true;
        extraOptions = {
          indent.char = "│";
         };
        debounce = 500;
    };

    plugins.lightline = {
      enable = true;
      colorscheme = "solarized";
    };

    extraPlugins = with pkgs.vimPlugins; [
      denops-vim
      vim-sandwich
    ];
  };
}
