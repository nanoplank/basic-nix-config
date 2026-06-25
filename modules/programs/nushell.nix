{...}: {
  flake.nixosModules.nushell = {...}: {
    hjem = {
      users = {
        nixed = {
          rum = {
            programs = {
              nushell = {
                enable = true;
                settings = {
                  buffer_editor = "hx";
                  show_banner = false;
                };
                extraConfig = ''
                  $env.editor = "hx"
                '';
                aliases = {
                  untar = "tar -xvf";
                  cl = "clear";
                };
              };
            };
          };
        };
      };
    };
  };
}
