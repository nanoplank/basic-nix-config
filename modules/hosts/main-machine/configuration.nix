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
      self.nixosModules.mainMachineHardware
      self.nixosModules.disko
      self.nixosModules.preservation
      self.nixosModules.users
      self.nixosModules.desktop
      self.nixosModules.system
      self.nixosModules.cli
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    system.stateVersion = "25.11";
  };
}
