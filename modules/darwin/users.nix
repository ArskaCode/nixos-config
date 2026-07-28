{ pkgs, ... }: {
  users.knownUsers = [ "arska" ];
  users.users.arska = {
    uid = 501;
    shell = pkgs.zsh;
  };
}
