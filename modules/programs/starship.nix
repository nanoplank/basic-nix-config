{...}: {
  flake.nixosModules.starship = {...}: {
    hjem.users = {
      nixed = {
        rum = {
          programs = {
            starship = {
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
}
