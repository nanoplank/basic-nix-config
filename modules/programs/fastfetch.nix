{...}: {
  flake.nixosModules.fastfetch = {...}: {
    hjem = {
      users = {
        nixed = {
          rum = {
            programs = {
              fastfetch = {
                enable = true;
                settings = {
                  modules = [
                    "title"
                    "separator"
                    "os"
                    "kernel"
                    "uptime"
                    "packages"
                    "terminal"
                    "shell"
                    "de"
                    "wm"
                    "cpu"
                    "gpu"
                    "memory"
                    "swap"
                    "disk"
                    "battery"
                    "poweradapter"
                    "break"
                    "colors"
                  ];
                };
              };
            };
          };
        };
      };
    };
  };
}
