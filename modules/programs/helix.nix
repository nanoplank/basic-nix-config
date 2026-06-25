{...}: {
  flake.nixosModules.helix = {...}: {
    hjem = {
      users = {
        nixed = {
          rum = {
            programs = {
              helix = {
                enable = true;
                settings = {
                  theme = "noctalia";
                  editor = {
                    cursor-shape = {
                      normal = "block";
                      insert = "bar";
                      select = "block";
                    };
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
