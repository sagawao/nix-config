{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
    inherit (self) outputs;
    in {
    nixosConfigurations = {
      lox = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
	 # home-manager.nixosModules.home-manager
	  #{
           # home-manager.useGlobalPkgs = true;
	    #home-manager.useUserPackages = true;
	    #home-manager.users.sagawao = import ./home/home.nix;
	  #}
        ];
      };
    };
    homeConfigurations = {
      "sagawao@lox" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
	modules = [./home/home.nix];
      };
    };
  };
}
