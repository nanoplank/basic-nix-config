{...}: {
  flake.nixosModules.variables = {...}: {
    environment = {
      variables = {
        PROTON_ENABLE_WAYLAND = 1;
        NIXOS_OZONE_WL = 1;
      };
    };
  };
}
