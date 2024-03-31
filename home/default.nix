{ isWSL, inputs, username }:

{ config, lib, pkgs, ... } : {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./alacritty.nix
    ./starship.nix
    ./zellij.nix
    ./zsh.nix
    ./nvim
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
      bat
      xclip
      direnv
      go-task
      deno # denops dependency
      nodejs-slim_20 # github copilot dependency
    ] ++ (lib.optionals (!isWSL) [
      firefox
      alacritty
      alacritty-theme
    ]) ++ (lib.optionals (isWSL) [
      wl-clipboard
    ]);

    sessionVariables = {
      EDITOR = "nvim";
      SHELL = "zsh";
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
    firefox.enable = !isWSL;
    bat.enable = true;
};
}
