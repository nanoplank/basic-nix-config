{...}: {
  flake.nixosModules.nushell = {...}: {
    hjem.users = {
      nixed = {
        rum = {
          programs = {
            nushell = {
              enable = true;
              settings = {
                buffer_editor = "nvim";
                show_banner = false;
              };
              extraConfig = ''
              $env.editor = "nvim"
              '';
              aliases = {
                untar = "tar -xvf";
                sysc = "systemctl";
                cl = "clear";
                v = "nvim";
              };
            };
          };
        };
      };
    };
  };
}
