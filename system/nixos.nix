{ config, pkgs, username, ... }:

{
  system.stateVersion = "23.11";
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      keep-outputs = true;
      keep-derivations = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    home = "/home/${username}";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    git
    zsh
    curl
];
  environment.variables.EDITOR = "vim";

  programs = {
    git.enable = true;
    zsh.enable = true;
  };
}

