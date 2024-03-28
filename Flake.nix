{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    dde-nixos = {
      url = "github:linuxdeepin/dde-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   };
  outputs = { self, nixpkgs, dde-nixos, ... } @ inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.<hostname> = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          dde-nixos.nixosModules.${system}
          {
            services.xserver.desktopManager.deepin-unstable.enable = true;
          }
          ./configuration.nix # your system configuration goes here
        ];
      };
    };
}
