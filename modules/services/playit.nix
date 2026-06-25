{inputs, ...}: {
  flake.nixosModules.playit = {
    config,
    lib,
    ...
  }: {
    imports = [inputs.playit-nixos-module.nixosModules.default];
    sops = {
      secrets = {
        playit-secret = {};
      };
    };

    systemd = {
      services = {
        playit = {
          wantedBy = lib.mkForce [];
        };
      };
    };

    services = {
      playit = {
        enable = true;
        secretPath = config.sops.secrets.playit-secret.path;
      };
    };
  };
}
