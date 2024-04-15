{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    # Build a custom WSL installer
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    nixos-wsl.inputs.nixpkgs.follows = "nixpkgs";
    vscode-server.url = "github:nix-community/nixos-vscode-server";
    
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, home-manager, vscode-server, catppuccin, ... } @inputs:
  let
    username = "sagawao";
    mkSystem = import ./lib/mksystem.nix {
      inherit nixpkgs inputs username catppuccin;
    };
    homeConfig = import ./home {
      inherit inputs username;
      isWSL = true;
      useDM = false;
    };
  in {
  
    nixosConfigurations.pingu = mkSystem "pingu" {
      system = "x86_64-linux";
      useDM = true;
    };

    nixosConfigurations.miffy = mkSystem "miffy" {
      system = "x86_64-linux";
      useDM = false;
    };

    nixosConfigurations.wsl = mkSystem "wsl" {
      system = "x86_64-linux";
      wsl = true;
    };

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ 
          homeConfig
	  catppuccin.homeManagerModules.catppuccin
      ];
    };
  };
}
