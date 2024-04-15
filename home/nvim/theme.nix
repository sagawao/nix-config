{ pkgs, ... }:
{
    programs.nixvim = {
        extraConfigLua = (builtins.readFile ./theme.lua);
       extraPlugins = [
           (pkgs.vimUtils.buildVimPlugin {
	       name = "solarized.nvim";
	       src = pkgs.fetchFromGitHub {
		   owner = "maxmx03";
		   repo = "solarized.nvim";
		   rev = "bb2b42a2ae2dcb078ff308992f013f5182a362ae";
		   sha256 = "00cyyfymwswvq2q707kfybfzph4r6v6zpbp5yjd6xichd4a9rz4a";
	       };
	   })
       ];
    };
}
