{ pkgs, ... }: {
  imports = [];

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    startMenuLaunchers = true;
  };

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };
}
