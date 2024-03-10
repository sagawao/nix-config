{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:
  {
    nixosConfigurations = {
      lox = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./system/configuration.nix ];
      };
    };
    homeConfigurations = {
      "sagawao@lox" = home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
	  system = "x86_64-linux";
	  overlays = [(import inputs.rust-overlay)];
	};
	modules = [ ./home ];
      };
    };
  };
}
