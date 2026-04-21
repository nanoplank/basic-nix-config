{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.fastfetch = {
    pkgs,
    lib,
    ...
  }: {
    perSystem = {pkgs, ...}: {
      packages.wrapfastfetch = inputs.wrapper-modules.wrappers.fastfetch.wrap {
        inherit pkgs;
        settings =
          (builtins.fromJSON
            (builtins.readFile ./config.jsonc)).settings;
      };
    };
  };
}
