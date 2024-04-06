{ pkgs, lib, ... }:
{
  imports = [
    ./lsp.nix
    ./theme.nix
    ./ddc.nix
    ./ddu.nix
    ./skkeleton.nix
  ];

  programs.nixvim = {
    enable = true;

    options = {
      number = true;
      relativenumber = true;
    };

    plugins.nvim-autopairs.enable = true;
    plugins.copilot-vim = {
      enable = true;
      settings = {
        filetypes = {
	  markdown = false;
	  text = false;
	};
      };
    };
    plugins.indent-blankline = {
        enable = true;
        extraOptions = {
          indent.char = "│";
         };
        debounce = 500;
    };

    extraPlugins = with pkgs.vimPlugins; [
      denops-vim
      vim-sandwich
    ];
  };
}
