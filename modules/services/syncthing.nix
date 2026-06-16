{...}: {
  flake.nixosModules.syncthing = {...}: {
    services = {
      syncthing = {
        enable = true;
        openDefaultPorts = true;
        settings = {
          gui = {
            user = "nixed";
          };
          options = {
            urAccepted = -1;
          };
        };
      };
    };
  };
}
