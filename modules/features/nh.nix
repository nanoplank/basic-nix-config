{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nh = {
    pkgs,
    lib,
    ...
  }: {
    programs.nh = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.nh;
    };
  };

  perSystem = {pkgs, ...}: {
    packages.nh = inputs.wrapper-modules.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.nh;
      env = {
        "NH_FLAKE" = ".#mainMachine";
      };
    };
  };
}
