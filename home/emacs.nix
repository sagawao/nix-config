{ pkgs, ... }: 
let
  doom = builtins.fetchGit {
    url = "git@github.com:hlissner/doom-emacs";
    name = "$HOME/emacs";
  };
in {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
   # };
  };
}
