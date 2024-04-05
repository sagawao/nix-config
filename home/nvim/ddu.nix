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
                name = "ddu.vim";
                owner = "Shougo";
                rev = "0f94a0ed0bc0808fcb7aac29eb8a5ac91b42e514";
                sha256 = "0rbzmqmcd9fdblg4qp703231smv4c8bjcwx3br0izcqmw62c9fzr";
            })
            (buildVimPlugin {
                name = "ddu-filter-matcher_substring";
                owner = "Shougo";
                rev = "3704a0b12affd8d3114c81c90e6b4cd7f7ef511";
                sha256 = "0av5cycpn9dlq4j1mv2riknsm4cd55d6g5y91g1x10mnslh1cg14";
            })
            (buildVimPlugin {
                name = "ddu-kind-file";
                owner = "Shougo";
                rev = "57467a6144cb3ac2cdb475945c3aa70a6eb691e8";
                sha256 = "0il30zim1z7zhzsfsq0v06zq9nsn0vnl8naf411pqg80wyyz6yva";
            })
            (buildVimPlugin {
                name = "ddu-source-file_rec";
                owner = "Shougo";
                rev = "09ebb6274179e36e888fd2aba69edc96c8ab95b9";
                sha256 = "1gzlqcfvh0inx44vfh905khgf8cxm7a7ds4bc29463978brfgmga";
            })
            (buildVimPlugin {
                name = "ddu-ui-ff";
                owner = "Shougo";
                rev = "c94c6295b929d209b39c94c745fc8c5905686351";
                sha256 = "0lc6804cr9p1blivdcflnrv5hzy3qv5l7p05k97iqkq2apakfjgd";
            })
        ];

        extraConfigLua = (builtins.readFile ./ddu.lua);
    };
}
