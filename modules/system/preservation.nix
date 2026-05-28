{inputs, ...}: {
  flake.nixosModules.preservation = {...}: {
    imports = [inputs.preservation.nixosModules.default];

    preservation = {
      enable = true;
      preserveAt."/persistent" = {
        directories = [
          "/var/lib/systemd/timers"
          "/var/lib/bluetooth"
          "/var/lib/tailscale"
          "/var/lib/libvirt"
          "/var/lib/mpd"
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
            "Documents"
            "Music"

            # dotfiles
            ".mozilla"
            ".steam"

            # .config
            ".config/noctalia"
            ".config/librewolf"
            ".config/r2modman"
            ".config/r2modmanPlus-local"
            ".config/sops"
           
            # .cache
            ".cache/noctalia"

            # .local
            ".local/share/zoxide"
            ".local/share/PrismLauncher"
            ".local/share/Steam"
          ];
        };
      };
    };
  };
}
