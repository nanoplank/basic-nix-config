{inputs, ...}: {
  flake.nixosModules.minecraft-servers = {pkgs, ...}: {
    imports = [inputs.nix-minecraft.nixosModules.minecraft-servers];
    nixpkgs.overlays = [inputs.nix-minecraft.overlay];

    services = {
      minecraft-servers = {
        enable = true;
        eula = true;
        openFirewall = true;
        servers = {
          vanilla = {
            enable = true;
            autoStart = false;
            jvmOpts = "-Xmx4G -Xms4G";
          };
        };
      };
    };
  };
}
