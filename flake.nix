{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix.url = "github:helix-editor/helix";
  };

  outputs = inputs: let
    lib = import ./lib.nix inputs;

    wslSystems = builtins.mapAttrs lib.mkWslSystem {
      koti = import ./hosts/koti;
    };

    linuxSystems = {};

    darwinSystems = builtins.mapAttrs lib.mkDarwinSystem {
      meno = import ./hosts/meno;
    };
  in {
    nixosConfigurations = wslSystems // linuxSystems;

    darwinConfigurations = darwinSystems;
  };
}
