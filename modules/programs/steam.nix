{...}: {
  flake.nixosModules.steam = {pkgs, ...}: {
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
        # ];
        protontricks.enable = true;
      };
    };
  };
}
