{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.minimalMachineConfiguration = {
    config,
    pkgs,
    ...
  }: {
    imports = [
      inputs.nvf.nixosModules.default
      inputs.hjem.nixosModules.default
      inputs.disko.nixosModules.disko
      inputs.preservation.nixosModules.default

      # hardware
      self.nixosModules.minimalMachineHardware

      # package bundles
      self.nixosModules.core

      # system
      self.nixosModules.users
      self.nixosModules.locale
      self.nixosModules.connectivity
      self.nixosModules.nix
      self.nixosModules.disko
      self.nixosModules.preservation

      # programs
      self.nixosModules.nushell
      self.nixosModules.nh
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    system.stateVersion = "25.11";
  };
}
