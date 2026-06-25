{...}: {
  flake.nixosModules.ghostty = {...}: {
    hjem = {
      users = {
        nixed = {
          rum = {
            programs = {
              ghostty = {
                enable = true;
                settings = {
                  theme = "noctalia";
                  background-opacity = 0.7;
                };
              };
            };
          };
        };
      };
    };
  };
}
