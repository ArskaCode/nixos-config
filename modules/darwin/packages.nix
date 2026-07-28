{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.ghostty-bin
    pkgs.darwin.xcode_26_5_Apple_silicon

    pkgs.signal-desktop
  ];
}
