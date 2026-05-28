{self, ...}: {
  flake.nixosModules.mainMachineConfiguration = {
    config,
    pkgs,
    ...
  }: {
    imports = with self.nixosModules; [
      # hardware
      mainMachineHardware

      # package bundles
      core
      extra
      desktop
      fonts

      # desktop 
      niri
      kde
      ly

      # system
      users
      hjem
      locale
      nvidia
      connectivity
      nix
      disko
      sops
      preservation

      # features 
      virtualization
      playit
      minecraft-servers
      gaming

      # programs
      fastfetch
      starship
      ghostty
      nushell
      zoxide
      kitty
      btop
      git
      nvf
      mpd
      nh
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # temporary fix: systemd-machine-id-commit.service
    boot.initrd.systemd.suppressedUnits = ["systemd-machine-id-commit.service"];
    systemd.suppressedSystemUnits = ["systemd-machine-id-commit.service"];

    # Kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    system.stateVersion = "25.11";
  };
}
