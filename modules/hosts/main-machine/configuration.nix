{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.mainMachineConfiguration = {
    config,
    pkgs,
    ...
  }: {
    imports = [
      inputs.nvf.nixosModules.default
      inputs.hjem.nixosModules.default
      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default
      inputs.sops-nix.nixosModules.sops

      # hardware
      self.nixosModules.mainMachineHardware

      # package bundles
      self.nixosModules.core
      self.nixosModules.extra
      self.nixosModules.desktop
      self.nixosModules.fonts

      # desktop
      self.nixosModules.niri
      self.nixosModules.kde
      self.nixosModules.ly

      # system
      self.nixosModules.users
      self.nixosModules.locale
      self.nixosModules.nvidia
      self.nixosModules.connectivity
      self.nixosModules.nix
      self.nixosModules.disko
      self.nixosModules.sops
      self.nixosModules.preservation

      # programs
      self.nixosModules.virtualization
      self.nixosModules.terminal
      self.nixosModules.nushell
      self.nixosModules.gaming
      self.nixosModules.nvf
      self.nixosModules.mpd
      self.nixosModules.nh
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    system.stateVersion = "25.11";
  };
}
