{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.mangowc = {
    pkgs,
    lib,
    ...
  }: {
    programs = {
      mangowc = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.mangowrap;
      };
    };
  };

  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.mangowrap = inputs.wrapper-modules.wrappers.mangowc.wrap {
      inherit pkgs;

      autostart_sh = ''
        ${lib.getExe self'.packages.myNoctalia}
      '';
    };
  };
}
