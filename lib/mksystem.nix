{ nixpkgs, inputs, username }:

name:
{ system, wsl ? false, useDM ? true}:

let
  isWSL = wsl;
  machineConfig = ../system/machines/${name}.nix;
  osConfig = ../system/nixos.nix;

in nixpkgs.lib.nixosSystem rec {

  inherit system;

  modules = [
    ( if isWSL then {
      imports = [
        inputs.nixos-wsl.nixosModules.wsl
        inputs.vscode-server.nixosModules.default
      ];
      services.vscode-server.enable = true;
    } else {} )
    
    machineConfig
    osConfig

    inputs.home-manager.nixosModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = import ../home/default.nix {
        inherit inputs username useDM isWSL;
      };
    }

    {
      config._module.args = {
        inherit isWSL useDM inputs username;
	currentSystem = system;
      };
    }
  ];
}
