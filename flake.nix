{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    silentSDDM,
    nix-cachyos-kernel,
    spicetify-nix,
    zen-browser,
    home-manager,
    ...
  }: {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit spicetify-nix zen-browser;
      };

      modules = [
        ./common/configuration.nix
        ./hosts/laptop/configuration.nix

        silentSDDM.nixosModules.default
        spicetify-nix.nixosModules.spicetify
        home-manager.nixosModules.home-manager
        {
          home-manager.users.mavgone =
            import ./common/home/mavgone.nix;
        }

        (
          { pkgs, ... }:
          {
            nixpkgs.overlays = [
              nix-cachyos-kernel.overlays.pinned
            ];

            boot.kernelPackages =
              pkgs.cachyosKernels.linuxPackages-cachyos-latest;
          }
        )
      ];
    };
  };
}
