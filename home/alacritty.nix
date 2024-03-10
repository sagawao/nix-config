{ config, ... }:

{
  programs.alacritty = {
    enable = true;
#    env.TERM = "xterm-256color";
    settings = {
      window = {
        padding.x = 20;
        padding.y = 10;
      };
      font.size = 7;
    };
  };
}
