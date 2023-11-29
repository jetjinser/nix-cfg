{
  description = "Jinser's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Code
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # Windows Manager
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs =
    inputs @ { self
    , nixpkgs
    , home-manager
    , ...
    }:
    let
      system = "x86_64-linux";

      nixOSModules = [
        ./nixos/configuration.nix
      ];

      homeManagerModules = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit system inputs; };
            users.jinser = import ./home-manager/home.nix;
          };
        }
      ];

      mkLinuxSystem = extraModules:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit system inputs; };
          modules = nixOSModules ++ homeManagerModules ++ extraModules;
        };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

      nixosConfigurations = {
        jinser = mkLinuxSystem [ ];
      };
    };
}
