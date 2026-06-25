{...}: {
  flake.nixosModules.mpd = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      rmpc
      mpc
    ];
    services = {
      mpd = {
        enable = true;
        user = "nixed";
        settings = {
          music_directory = "/home/nixed/Music/";
          audio_output = [
            {
              type = "pipewire";
              name = "My PipeWire Output";
            }
          ];
        };
      };
    };
    systemd = {
      services = {
        mpd = {
          environment = {
            XDG_RUNTIME_DIR = "/run/user/1000";
          };
        };
      };
    };
  };
}
