{ isWSL, inputs, ... }:

{ config, lib, pkgs, ... }: {
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
      zellij
      starship
      zsh
      direnv
    ] ++ (lib.optionals (!isWSL) [
      firefox
      alacritty
      alacritty-theme
    ]);

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
    };
    
    file = (if (!isWSL) then {
      "wallpaper.png" = {
        target = "/Wallpaper/wallpaper.png";
	source = ./wallpaper/nix-wallpaper-nineish-solarized-light.png;
       };
      } else {});
  };
  
  programs.git = {
    enable = true;
    userName = "sagawao";
    userEmail = "heutronica@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs = {
    zellij.enable = true;
    home-manager.enable = true;
    firefox.enable = !isWSL;
  };
}
