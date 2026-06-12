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
          # latest (online-mode)
          vanilla = {
            enable = true;
            autoStart = false;
            jvmOpts = "-Xmx4G -Xms4G";

            package = pkgs.vanillaServers.vanilla;

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
          #   # 1.16.5 (offline-mode)
          #   vanilla-offline = {
          #     enable = true;
          #     autoStart = false;
          #     jvmOpts = "-Xmx4G -Xms4G";

          #     package = pkgs.vanillaServers.vanilla-1_16_5;

          #     serverProperties = {
          #       max-players = 4;
          #       online-mode = false;
          #       motd = "NixOS Minecraft server!";
          #     };

          #     operators = {
          #       elevons = {
          #         uuid = "cf3e79eb-84a3-39d5-9148-ea8a9af1fc6b";
          #         level = 3;
          #         bypassesPlayerLimit = true;
          #       };
          #     };
          #   };
        };
      };
    };
  };
}
