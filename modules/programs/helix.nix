{...}: {
  flake.nixosModules.helix = {...}: {
    hjem.users = {
      nixed = {
        rum = {
          programs = {
            helix = {
              enable = true;
              settings = {
                theme = "onedark";
                editor = {
                  editor = {
                    statusline = {
                      left = [
                        "mode"
                        "spinner"
                      ];
                    };
                  };
                  line-number = "relative";
                };
              };
            };
          };
        };
      };
    };
  };
}
