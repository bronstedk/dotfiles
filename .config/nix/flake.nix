{
  description = "bronstedk nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # brew
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    nix-homebrew,
    ...
  }: {
    darwinConfigurations = {
      "my_mac" = nix-darwin.lib.darwinSystem {
        modules = [
          ./modules
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "bronstedk";
            };
          }
        ];
      };
    };
  };
}
