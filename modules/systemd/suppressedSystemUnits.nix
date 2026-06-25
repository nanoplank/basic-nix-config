{...}: {
  flake.nixosModules.suppressedSystemUnits = {...}: {
    systemd = {
      suppressedSystemUnits = ["systemd-machine-id-commit.service"];
    };
  };
}
