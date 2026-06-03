{...}: {
  flake.nixosModules.kitty = {...}: {
    hjem.users = {
      nixed = {
        rum = {
          programs = {
            kitty = {
              enable = true;
              settings = {
                include = "themes/noctalia.conf";
                font_family = "JetBrainsMono";
                confirm_os_window_close = 0;
                background_opacity = 0.7;
                cursor_trail = 1;
                font_size = 10;
              };
            };
          };
        };
      };
    };
  };
}
