{
  flake.nixosModules.gaming = {
    pkgs,
    lib,
    ...
  }: {
    hardware.nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
    };

    hardware.nvidia.prime = {
      # offload.enable = true;
      # offload.enableOffloadCmd = true;
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:01:00:0";
    };

    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
        #    package = pkgs.steam.override {
        #       extraProfile = ''
        #         unset TZ
        #         export PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1
        #      '';

        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
        # extraPackages = with pkgs; [
        #   SDL2
        #   gamescope
        #   er-patcher
        # ];
        protontricks.enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      lutris
      prismlauncher
      osu-lazer-bin
      dxvk
      gamescope
      mangohud
      r2modman
      heroic
      steamtinkerlaunch
      wivrn
      wayvr
    ];
  };
}
