{...}: {
  flake.nixosModules.languages = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ghc
      rustup
    ];
  };
}
