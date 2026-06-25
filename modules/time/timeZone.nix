{...}: {
  flake.nixosModules.timeZone = {...}: {
    time = {
      timeZone = "Europe/Moscow";
    };
  };
}
