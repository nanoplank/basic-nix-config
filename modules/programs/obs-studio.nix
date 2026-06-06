{...}: {
  flake.nixosModules.obs-studio = {...}: {
    programs = {
      obs-studio = {
        enable = true;
        enableVirtualCamera = true;
      };
    };
  };
}
