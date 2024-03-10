{ config, pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./starship.nix
    ./zsh.nix
    ./neovim.nix
  ];

  home = rec {
    username = "sagawao";
    homeDirectory = "/home/${username}";
    stateVersion = "22.11";

    packages = with pkgs; [
      git
      alacritty
      zellij
      starship
      zsh
    ];

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
    };
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "sagawao";
    userEmail = "heutronica@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.zellij = {
    enable = true;
  };
}
