{ pkgs, ... }: {
  imports = [];

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = "sagawao";
    wslConf.user.default = "sagawao";
    startMenuLaunchers = true;
  };
}
