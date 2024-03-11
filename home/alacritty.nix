{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding.x = 20;
        padding.y = 10;
      };
      font.size = 7;
      import = [ "${pkgs.alacritty-theme}/solarized_light.toml" ];
    };
  };
}
