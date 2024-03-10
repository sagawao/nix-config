{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    
    extraPackages = with pkgs; [
      nodePackages.eslint
      nodePackages.prettier
      nodePackages.typescript-language-server
      rust-analyzer
    ];
  };
}
