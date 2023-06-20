
  description = "Starterkit"; # // Configuration for NixOS //

  inputs = { # // Repos //
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
     };
  outputs = { self, nixpkgs, home-manager, ... } @ inputs: { 
    nixosConfigurations = {
      HOSTNAME = nixpkgs.lib.nixosSystem { # FIXME: Replace `HOSTNAME` with your hostname
        system = "x86_64-linux";

        modules = [
          { _module.args = { inherit inputs; }; }
          {
            nixpkgs.config.allowUnfree = true;
          }
          # // List your modules + configuration.nix //
          # .modules/Main/Nix
          ./modules/Desktop/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
               extraSpecialArgs = { inherit inputs; };
                users.USERNAME.imports = [ ./home.nix ]; # FIXME: Replace `USERNAME` With your username
            };
          }
        ];
      };
    };
  };
}
