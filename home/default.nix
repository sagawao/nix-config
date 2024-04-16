{ useDM ? true, isWSL ? false, inputs, username }:

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
      ripgrep
      skim
      eza
      xclip
      direnv
      go-task
      skk-dicts # for skkeleton
      deno # for denops.vim
      nodejs-slim_20 # for gh copilot
    ] ++ (lib.optionals (useDM) [
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
    
    file = (if (useDM) then {
      "wallpaper.png" = {
        target = "/Wallpaper/wallpaper.png";
	      source = ./wallpaper/nix-wallpaper-nineish-solarized-light.png;
       };
      } else {});
  };
  
  # themes
  catppuccin.flavour = "latte";
  gtk = (if (!isWSL) then {
    enable = true;
    theme = {
      name = "Catppuccin-Latte";
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
	size = "compact";
	tweaks = [ "rimless" "black" ];
	variant = "latte";
      };
    };
  } else {});

  xdg.configFile = (if (!isWSL) then {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css"; 
  } else {});

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

  programs.bat = {
    enable = true;
    config = {
      # theme = "Solarized (light)";
    };
    catppuccin.enable = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = true;
  };

  programs = {
    ripgrep.enable = true;
    skim.enable = true;
    home-manager.enable = true;
    firefox.enable = useDM;
  };

}
