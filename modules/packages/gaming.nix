{...}: {
  flake.nixosModules.gaming = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      prismlauncher
      osu-lazer-bin
      dxvk
      gamescope
      mangohud
      r2modman
      heroic
      steamtinkerlaunch
    ];
  };
}
