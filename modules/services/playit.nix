{inputs, ...}: {
  flake.nixosModules.playit = {config, ...}: {
    imports = [inputs.playit-nixos-module.nixosModules.default];
    sops.secrets.playit-secret = {};

    services = {
      playit = {
        enable = false;
        secretPath = config.sops.secrets.playit-secret.path;
      };
    };
  };
}
