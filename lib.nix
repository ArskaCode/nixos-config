inputs: let
  defaultModules = name: [
    { config.networking.hostName = name; }
    ./modules/common
  ];

  linuxModules = [
    ./modules/linux
  ];

  wslModules = [
    ./modules/wsl
  ];

  darwinModules = [
    ./modules/darwin
  ];

  mkWslSystem = name: module: inputs.nixpkgs.lib.nixosSystem {
    modules = (defaultModules name) ++ linuxModules ++ wslModules ++ [ module ];
    specialArgs = { inherit inputs; };
  };

  mkDarwinSystem = name: module: inputs.nix-darwin.lib.darwinSystem {
    modules = (defaultModules name) ++ darwinModules ++ [ module ];
    specialArgs = { inherit inputs; };
  };
in {
  inherit mkWslSystem mkDarwinSystem;
}
