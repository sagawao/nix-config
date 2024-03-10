# just is a command runner, Justfile is very similar to Makefile, but simpler.

############################################################################
#
#  Nix commands related to the local machine
#
############################################################################

osdeploy:
  sudo nixos-rebuild switch --flake .#lox

osdebug:
  nixos-rebuild switch --flake .#lox --show-trace --verbose

sagawao:
  nix run nixpkgs#home-manager -- switch --flake .#sagawao@lox

up:
  nix flake update

history:
  nix profile history --profile /nix/var/nix/profiles/system

repl:
  nix repl -f flake:nixpkgs

clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
  # garbage collect all unused nix store entries
  sudo nix-collect-garbage --delete-old

