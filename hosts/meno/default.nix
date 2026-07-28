{
  imports = [ ./hardware.nix ];

  nix = {
    linux-builder.enable = true;
    settings.trusted-users = [ "@admin" ];
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
