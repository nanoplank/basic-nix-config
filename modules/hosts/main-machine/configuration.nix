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
      self.nixosModules.mainMachineHardware
      self.nixosModules.users
      self.nixosModules.desktop
      self.nixosModules.system
      self.nixosModules.cli
    ];

    # Bootloader
    boot.loader = {
      grub = {
        efiSupport = true;
        device = "nodev";
      };
    };

    boot.loader.efi.canTouchEfiVariables = true;
    # Kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    system.stateVersion = "25.11";
  };
}
