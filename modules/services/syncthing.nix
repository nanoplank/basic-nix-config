{...}: {
  flake.nixosModules.syncthing = {...}: {
    services = {
      syncthing = {
        enable = true;
        openDefaultPorts = true;
        settings = {
          options = {
            urAccepted = -1;
          };
        };
      };
    };
  };
}
