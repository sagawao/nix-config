{ pkgs, ... }:
{
    programs.nixvim = {
        extraConfigLua = (builtins.readFile ./theme.lua);
        extraPlugins = with pkgs.vimPlugins; [
            solarized-nvim
        ];
    };
}
