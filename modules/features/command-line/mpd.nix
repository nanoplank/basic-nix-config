{...}: {
  flake.nixosModules.nvf = {...}: {
    services = {
      mpd = {
        enable = true;
      };
    };
  };
}
