{ pkgs, lib, ... }:
{
  imports = [
    ./nvim/lsp.nix
    ./nvim/theme.nix
    ./nvim/ddc.nix
  ];
  programs.nixvim = {
    enable = true;
  
    options = {
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
        nixGrammars = true;
        indent = true;
      };
      treesitter-context.enable = true;
      rainbow-delimiters.enable = true;
    };
    
    plugins.nvim-autopairs.enable = true;
    
    extraPlugins = with pkgs.vimPlugins; [
      denops-vim
      vim-sandwich
    ];
  };
}