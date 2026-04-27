{...}: {
  flake.nixosModules.languages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      haskellPackages.ghcup
    ];
  };
}
