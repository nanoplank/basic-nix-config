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
            serverProperties = {
              max-players = 4;
              white-list = true;
              motd = "NixOS Minecraft server!";
            };
            whitelist = {
              elevons = "9d6ff915-0c04-4e95-b1b2-0b1dc3b47c88";
            };
            operators = {
              elevons = {
                uuid = "9d6ff915-0c04-4e95-b1b2-0b1dc3b47c88";
                level = 3;
                bypassesPlayerLimit = true;
              };
            };
            jvmOpts = "-Xmx4G -Xms4G";
          };
        };
      };
    };
  };
}
