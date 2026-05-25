{...}: {
  flake.nixosModules.nushell = {...}: {
    hjem.users = {
      nixed = {
        rum = {
          programs = {
            nushell = {
              enable = true;
              settings = {
                show_banner = false;
                buffer_editor = "nvim";
              };
            };
          };
        };
      };
    };
  };
}
