{...}: {
  flake.nixosModules.zoxide = {...}: {
    hjem = {
      users = {
        nixed = {
          rum = {
            programs = {
              zoxide = {
                enable = true;
                integrations = {
                  nushell = {
                    enable = true;
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
