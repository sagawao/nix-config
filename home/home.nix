{ config, pkgs, ... }: {
  imports = [
    ./alacritty.nix
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
      cowsay
    ];

    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
    };
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
  };

  programs.git = {
    enable = true;
    userName = "sagawao";
    userEmail = "heutronica@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.starship = {
    enable = true;
  };

  programs.zellij = {
    enable = true;
  };
}
