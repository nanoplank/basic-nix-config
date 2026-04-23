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
      self.nixosModules.mainMachineHardware
      self.nixosModules.gaming
      self.nixosModules.niri
      self.nixosModules.nh
      self.nixosModules.ly
      self.nixosModules.nvf
      self.nixosModules.nix
      self.nixosModules.fish
      self.nixosModules.packages
      self.nixosModules.networking
      self.nixosModules.locale
      self.nixosModules.extravimplugins
      inputs.nvf.nixosModules.default
    ];

    # Bootloader
    boot.loader = {
      grub = {
        efiSupport = true;
        device = "nodev";
      };
    };

    boot.loader.efi.canTouchEfiVariables = true;

    # Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # BlueTooth
    hardware.bluetooth = {
      enable = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };

    users.users.nixed = {
      isNormalUser = true;
      description = "Nixed";
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.fish;
    };

    # List services that you want to enable:
    services = {
      desktopManager.plasma6.enable = true;
      xserver.videoDrivers = ["nvidia"];
    };

    system.stateVersion = "25.11";
  };
}
