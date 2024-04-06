{ pkgs, ... }:

let
  buildVimPlugin = { name, owner, rev, sha256 }: pkgs.vimUtils.buildVimPlugin rec {
    inherit name;
    src = pkgs.fetchFromGitHub {
      inherit owner rev sha256;
      repo = name;
    };
  };
in
{
    programs.nixvim = {
        extraPlugins = [
            (buildVimPlugin {
                name = "skkeleton";
                owner = "vim-skk";
                rev = "438b9d22d926569db6e6034e0d333edce5f4d4cf";
                sha256 = "1si9vs48v0fpx13bi417gcj95ncdaxws4q4lf8w7q9xj307wqwwd";
             })
	];

	extraConfigLua =
	  (builtins.readFile ./skkeleton.lua) + ''
	  vim.fn['skkeleton#config']({
              globalDictionaries = {'${pkgs.skk-dicts}/share/SKK-JISYO.L'},
          })
	  '';
    };
}
