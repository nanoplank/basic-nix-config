{...}: {
  flake.nixosModules.helix = {...}: {
    hjem.users = {
      nixed = {
        rum = {
          programs = {
            helix = {
              enable = true;
              settings = {
                theme = "noctalia";
              };
            };
          };
        };
      };
    };
  };
}
