{...}: {
  flake.nixosModules.initrd = {...}: {
    boot = {
      initrd = {
        systemd = {
          suppressedUnits = ["systemd-machine-id-commit.service"];
        };
      };
    };
  };
}
