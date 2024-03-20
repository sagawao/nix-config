{ isWSL, inputs, username }:

{ config, lib, pkgs, ... } : {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./alacritty.nix
    ./starship.nix
    ./zsh.nix
    ./neovim.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    packages = with pkgs; [
      git
      gitui
      zellij
      starship
      zsh
      direnv
      go-task
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
    userName = "rn sagawa";
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
    home-manager.enable = true;
    zellij.enable = true;
    firefox.enable = !isWSL;
  };
}
