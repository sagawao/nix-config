{ pkgs, ... }:
{
    programs.nixvim = {
        colorscheme = "solarized";
        extraConfigLua = ''
        vim.o.background = 'light'
        vim.g.solarized_disable_background = true
        '';
        extraPlugins = with pkgs.vimPlugins; [
            solarized-nvim
        ];
    };
}