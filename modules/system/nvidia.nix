{...}: {
  flake.nixosModules.nvidia = {pkgs, ...}: {
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          nvidia-vaapi-driver
        ];
      };

      nvidia = {
        videoAcceleration = true;
        modesetting.enable = true;
        powerManagement.enable = true;
        nvidiaSettings = true;
        open = true;

        prime = {
          # sync.enable = true;
          offload.enable = true;
          offload.enableOffloadCmd = true;
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:01:00:0";
        };
      };
    };

    environment = {
      variables = {
        LIBVA_DRIVER_NAME = "nvidia";
      };
    };

    services = {
      lact = {
        enable = true;
      };
      xserver = {
        videoDrivers = ["nvidia"];
      };
    };
  };
}
