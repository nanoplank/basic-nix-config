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
      self.nixosModules.gaming
      self.nixosModules.niri
      self.nixosModules.nh
      self.nixosModules.ly
      self.nixosModules.nvf
      self.nixosModules.nix
      self.nixosModules.fish
      self.nixosModules.packages
      self.nixosModules.connectivity
      self.nixosModules.locale
      self.nixosModules.fonts
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

    users.users.nixed = {
      isNormalUser = true;
      description = "Nixed";
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.fish;
    };

    hjem.users = {
      nixed = {
        user = "nixed";
        directory = "/home/nixed";
        files = {
          ".config/test.json".text = "stuff";
        };
      };
    };

    # List services that you want to enable:
    services = {
      desktopManager.plasma6.enable = true;
      xserver.videoDrivers = ["nvidia"];
    };

    system.stateVersion = "25.11";
  };
}
