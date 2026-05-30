{...}: {
  flake.nixosModules.boot = {pkgs, ...}: {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      loader = {
        systemd-boot = {
          enable = true;
        };
        efi = {
          canTouchEfiVariables = true;
        };
      };
    };

    # temporary fix: systemd-machine-id-commit.service
    boot.initrd.systemd.suppressedUnits = ["systemd-machine-id-commit.service"];
    systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];
  };
}
