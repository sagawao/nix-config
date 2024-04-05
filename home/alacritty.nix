{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding.x = 10;
        padding.y = 10;
      };
      font.size = 7;
      font.offset.y = 5;
      import = [ "${pkgs.alacritty-theme}/solarized_light.toml" ];
    };
  };
}
