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

    networking.hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # BlueTooth
    hardware.bluetooth = {
      enable = true;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };

    # Set your time zone.
    time.timeZone = "Europe/Moscow";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us,ru";
      variant = "";
    };

    users.users.nixed = {
      isNormalUser = true;
      description = "Nixed";
      extraGroups = ["networkmanager" "wheel"];
      shell = pkgs.fish;
    };

    # Open ports in the firewall.
    networking = {
      firewall.enable = true;
      firewall.allowedTCPPorts = [9757];
      firewall.allowedUDPPorts = [9757 5353];
    };

    system.stateVersion = "25.11";
  };
}
