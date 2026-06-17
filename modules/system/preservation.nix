{inputs, ...}: {
  flake.nixosModules.preservation = {...}: {
    imports = [inputs.preservation.nixosModules.default];

    preservation = {
      enable = true;
      preserveAt."/persistent" = {
        directories = [
          "/var/lib/power-profiles-daemon"
          "/var/lib/systemd/timers"
          "/var/lib/bluetooth"
          "/var/lib/tailscale"
          "/var/lib/libvirt"
          "/srv/minecraft"
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
            "Projects"
            "Music"

            # dotfiles
            ".mozilla"
            ".steam"
            ".ssh"

            # .config
            ".config/noctalia"
            ".config/qt6ct"
            ".config/librewolf"
            ".config/r2modman"
            ".config/r2modmanPlus-local"
            ".config/sops"

            # .cache
            ".cache/noctalia"

            # .local/share
            ".local/share/zoxide"
            ".local/share/PrismLauncher"
            ".local/share/osu"
            ".local/share/Steam"
          ];
        };
      };
    };
  };
}
