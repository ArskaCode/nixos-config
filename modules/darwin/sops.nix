{ inputs, ... }: {
  imports = [ inputs.sops-nix.darwinModules.default ];

  sops.age.generateKey = true;
}
