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
      alacritty-theme
      zellij
      starship
      zsh
      direnv
      firefox
    ];

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
    };
    
    file = {
      "wallpaper.png" = {
        target = "/Wallpaper/wallpaper.png";
	source = ./wallpaper/nix-wallpaper-nineish-solarized-light.png;
      };
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

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.zellij = {
    enable = true;
  };
}
