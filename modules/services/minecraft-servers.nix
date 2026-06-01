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

            package = pkgs.vanillaServers.vanilla-26_1_2;

            serverProperties = {
              max-players = 4;
              motd = "NixOS Minecraft server!";
            };

            operators = {
              elevons = {
                uuid = "9d6ff915-0c04-4e95-b1b2-0b1dc3b47c88";
                level = 3;
                bypassesPlayerLimit = true;
              };
            };
          };
        };
      };
    };
  };
}
