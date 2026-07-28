{ pkgs, ... }: {
  users.users.arska = {
    isNormalUser = true;
    shell = pkgs.nushell;
  };
}
