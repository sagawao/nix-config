{ nixpkgs, inputs }:

name:
{ system, wsl ? false }:

let
  isWSL = wsl;
  machineConfig = ../system/machines/${name}.nix;
  osConfig = ../system/nixos.nix;
in nixpkgs.lib.nixosSystem rec {
  inherit system;

  modules = [
    ( if isWSL then inputs.nixos-wsl.nixosModules.wsl else {} )
    
    machineConfig
    osConfig

    inputs.home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.sagawao = import ../home/default.nix {
        isWSL = isWSL;
	inputs = inputs;
      };
    }

    {
      config._module.args = {
        currentSystem = system;
	isWSL = isWSL;
	inputs = inputs;
      };
    }
  ];
}
