{...}: {
  flake.nixosModules.nushell = {...}: {
    hjem.users.nixed.rum.programs = {
      starship = {
        integrations = {
          nushell = {
            enable = true;
          };
        };
      };

      zoxide = {
        integrations = {
          nushell = {
            enable = true;
          };
        };
      };

      nushell = {
        enable = true;
        settings = {
          show_banner = false;
        };
      };
    };
  };
}
