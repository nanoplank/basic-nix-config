{...}: {
  flake.nixosModules.git = {config, ...}: {
    sops.secrets."git/email" = {};
    sops.secrets."git/name" = {};

    sops.templates."config" = {
      owner = "nixed";
      content = ''
        [user]
        email = ${config.sops.placeholder."git/email"}
        name = ${config.sops.placeholder."git/name"}
      '';
      path = "/home/nixed/.config/git/config";
    };
  };
}
