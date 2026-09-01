{ pkgs, inputs, ... }: let
  helix-pkgs = inputs.helix.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    helix-pkgs.helix
    pkgs.git
    pkgs.jujutsu
    pkgs.ripgrep

    pkgs.nixd

    pkgs.codex
    pkgs.claude-code
  ];
}
