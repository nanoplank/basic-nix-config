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
              aliases = {
                cl = "clear";
              };
            };
          };
        };
      };
    };
  };
}
