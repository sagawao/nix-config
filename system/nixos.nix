{ config, pkgs, ... }:

{
  system.stateVersion = "23.11";
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      keep-outputs = true;
      keep-derivations = true;
    };
  };

  users.users.sagawao = {
    isNormalUser = true;
    home = "/home/sagawao";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    zsh
    just
    curl
];
  environment.variables.EDITOR = "nvim";

  programs = {
    neovim.enable = true;
    git.enable = true;
    zsh.enable = true;
  };
}

