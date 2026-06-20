{inputs, ...}: {
  flake.nixosModules.noctalia5 = {pkgs, ...}: {
    environment.systemPackages = [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
