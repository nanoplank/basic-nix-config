{...}: {
  flake.nixosModules.services = {pkgs, ...}: {
    # List services that you want to enable:
    services = {
      desktopManager.plasma6.enable = true;
    };
    environment = {
      plasma6 = {
        excludePackages = [
          pkgs.kdePackages.discover
          pkgs.kdePackages.qrca
          pkgs.kdePackages.konsole
        ];
      };
    };
  };
}
