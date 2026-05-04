{...}: {
  flake.nixosModules.mpd = {...}: {
    services = {
      mpd = {
        enable = true;
        settings = {
          music_directory = "/home/nixed/Music/";
          audio_output = [
            {
              type = "pipewire";
              name = "pipewire output";
            }
          ];
        };
      };
    };
  };
}
