{...}: {
  flake.nixosModules.preservation = {...}: {
    preservation = {
      enable = true;
      preserveAt."/persistent" = {
        directories = [
          "/var/lib/systemd/timers"
          "/var/lib/bluetooth"
          {
            directory = "/var/lib/nixos";
            inInitrd = true;
          }
        ];

        files = [
          {
            file = "/etc/machine-id";
            inInitrd = true;
          }
        ];

        users.nixed = {
          directories = [
            "basic-nix-config"
            "Wallpapers"
            ".config/librewolf/" 
            ".mozilla"
            ".local/share/zoxide"
            ".local/share/Steam"
            ".steam"
          ];
        };
      };
    };
  };
}
