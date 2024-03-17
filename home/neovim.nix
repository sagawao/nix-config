{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    options = {
      relativenumber = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      denops-vim
      vim-sandwich
    ];
  };
}
