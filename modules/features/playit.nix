{
  inputs,
  config,
  ...
}: {
  flake.nixosModules.playit = {...}: {
    imports = [inputs.playit-nixos-module.nixosModules.default];

    services = {
      playit = {
        enable = true;
        secretPath = config.sops.secrets.playitsecret.path;
      };
    };
  };
}
