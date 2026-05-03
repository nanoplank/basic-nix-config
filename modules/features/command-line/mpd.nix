{...}: {
  flake.nixosModules.mpd = {...}: {
    services = {
      mpd = {
        enable = true;
        settings = {
          audio_output = [
            {
              type = "pipewire";
              name = "mpd pipewire";
            }
          ];
        };
      };
    };
  };
}
