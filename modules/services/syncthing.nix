{...}: {
  flake.nixosModules.syncthing = {config, ...}: {
    sops.secrets."syncthing/guipassword" = {};
    services = {
      syncthing = {
        enable = true;
        guiPasswordFile = config.sops.secrets."syncthing/guipassword".path;
        settings = {
          options = {
            urAccepted = -1;
            user = "nixed";
          };
          folders = {
            "/var/lib/syncthing" = {
              id = "shared";
            };
          };
        };
      };
    };
  };
}
