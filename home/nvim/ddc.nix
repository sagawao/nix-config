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
                name = "ddc.vim";
                owner = "Shougo";
                rev = "57911b2cdc5f1758e974cec9246ccab2d8289a7f";
                sha256 = "0i3zw74sisgjky17d4242c1zr1qiyblx1nwpbw1rvwqhdh1mwm7l";
            })
            (buildVimPlugin {
                name = "denops-signature_help";
                owner = "matsui54";
                rev = "f5a80ec66faa016952df0f267f9f4c43d8dbe1b6";
                sha256 = "0bsw3dhbzzk9apvs7lzgbhcr820g6vpvw9dd84sl1g0hlsi3mafs";
            })
            (buildVimPlugin {
                name = "denops-popup-preview.vim";
                owner = "matsui54";
                rev = "5a62ac76478791a86f17ac79f064ab302c41f5eb";
                sha256 = "1l7q09d2k9r191qnrr462jgvvglyyjmb426cq1maznc9bv7mrch8";
            })
            (buildVimPlugin {
                name = "ddc-source-lsp";
                owner = "Shougo";
                rev = "682d8551fc2b3c30412ff6f26fa57a7c8c712057";
                sha256 = "0si2y3f4clhsxfxazhpq02cg20c0vg78fid3n2fb6qg6vgs1lhvy";
            })
            (buildVimPlugin {
                name = "ddc-source-around";
                owner = "Shougo";
                rev = "fff06e9eed4c68a0ef0892d41e108c81edd5268c";
                sha256 = "11f3dxcy7a5v6nf6ninlw4x1cfwnccz7495r8xjn1svb8qysaiw4";
            })
            (buildVimPlugin {
                name = "ddc-ui-native";
                owner = "Shougo";
                rev = "3f370d0da93bd47bb3a937a0c8f8193582eee8c8";
                sha256 = "1knfvwcd7wfiy1vh2m9gwr5wh1crn60mmvpjwdqa739m8nrdfw79";
            })
	    (buildVimPlugin {
	        name = "ddc-ui-pum";
		owner = "Shougo";
		rev = "6fd98ba227889883bbf75405506c451feaae6ef8";
		sha256 = "1yy572i672ha5zlxkda6lv5mp2y5yq0sd1ffpa6my59rzv86ixr7";
	    })
	    (buildVimPlugin {
	    	name = "pum.vim";
		owner = "Shougo";
		rev = "0aae6a6d4cc356794925832d144a4e20af70aebb";
		sha256 = "0lcmfyrir4pppvpcx4d592w144yxy20f7pjmi1hbxavaqsdmv4zq";
	    })
            (buildVimPlugin {
                name = "ddc-fuzzy";
                owner = "tani";
                rev = "ee205bba8011a941380412a34e47ca67bb5fa41f";
                sha256 = "0jkzfixiw2baps448m6nvlkg1ww6hd44sk0jay4x7xdzsjxxiqdm";
            })
	];

        extraConfigLua = (builtins.readFile ./ddc.lua);
    };
}
