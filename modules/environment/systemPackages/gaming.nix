{...}: {
  flake.nixosModules.gaming = {pkgs, ...}: {
    environment = {
      systemPackages = with pkgs; [
        prismlauncher
        osu-lazer-bin
        dxvk
        mangohud
        r2modman
      ];
    };
  };
}
