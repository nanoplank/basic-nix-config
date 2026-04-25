{...}: {
  flake.nixosModules.services = {...}: {
    # List services that you want to enable:
    services = {
      desktopManager.plasma6.enable = true;
    };
  };
}
